package services

import (
	"database/sql"
	"errors"
	"sync"

	"github.com/tomonakar/go_api_training/apperrors"
	"github.com/tomonakar/go_api_training/models"
	"github.com/tomonakar/go_api_training/repositories"
)

// PostArticleHandlerで使うことを想定したサービス
// 引数の情報をもとに新しい記事を作り、結果を返却
func (s *MyAppService) PostArticleService(article models.Article) (models.Article, error) {
	newArticle, err := repositories.InsertArticle(s.db, article)
	if err != nil {
		err = apperrors.InsertDataFailed.Wrap(err, "fail to insert article")
		return models.Article{}, err
	}
	return newArticle, nil
}

// ArticleListHandlerで使うことを想定したサービス
// 指定pageの記事一覧を返却
func (s *MyAppService) GetArticleListService(page int) ([]models.Article, error) {
	articleList, err := repositories.SelectArticleList(s.db, page)
	if err != nil {
		err = apperrors.GetDataFailed.Wrap(err, "fail to get data")
		return nil, err
	}

	if len(articleList) == 0 {
		err = apperrors.NAData.Wrap(ErrNoData, "no data")
		return nil, err
	}

	return articleList, nil
}

// ArticleDetailHandlerで使うことを想定したサービス
// 指定IDの記事情報を返却
func (s *MyAppService) GetArticleService(articleID int) (models.Article, error) {
	var article models.Article
	var commentList []models.Comment
	var articleGetErr, commentGetErr error

	// 並列処理を行うためのMutex
	var amu sync.Mutex
	var cmu sync.Mutex

	// 並列処理を行うためのWaitGroup
	var wg sync.WaitGroup
	wg.Add(2)

	go func(db *sql.DB, articleID int) {
		defer wg.Done()
		amu.Lock()
		article, articleGetErr = repositories.SelectArticleDetail(db, articleID)
		amu.Unlock()
	}(s.db, articleID)

	go func(db *sql.DB, articleID int) {
		defer wg.Done()
		cmu.Lock()
		commentList, commentGetErr = repositories.SelectCommentList(s.db, articleID)
		cmu.Unlock()
	}(s.db, articleID)

	// 並列処理の終了を待つ
	wg.Wait()

	if articleGetErr != nil {
		if errors.Is(articleGetErr, sql.ErrNoRows) {
			err := apperrors.NAData.Wrap(articleGetErr, "no data")
			return models.Article{}, err
		}
		err := apperrors.GetDataFailed.Wrap(articleGetErr, "fail to get data")
		return models.Article{}, err
	}

	if commentGetErr != nil {
		err := apperrors.GetDataFailed.Wrap(commentGetErr, "fail to get data")
		return models.Article{}, err
	}

	article.CommentList = append(article.CommentList, commentList...)

	return article, nil
}

// PostNiceHandlerで使うことを想定したサービス
// 指定IDの記事のいいね数を+1して、結果を返却
func (s *MyAppService) PostNiceService(article models.Article) (models.Article, error) {
	err := repositories.UpdateNiceNum(s.db, article.ID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			err = apperrors.NoTargetData.Wrap(err, "does not exist target article")
			return models.Article{}, err
		}
		err = apperrors.UpdateDataFailed.Wrap(err, "fail to update data")
		return models.Article{}, err
	}

	return models.Article{
		ID:        article.ID,
		Title:     article.Title,
		Contents:  article.Contents,
		UserName:  article.UserName,
		NiceNum:   article.NiceNum + 1,
		CreatedAt: article.CreatedAt,
	}, nil
}

// raceConditionとは、複数の処理が同時に実行された場合に、処理の順番によって結果が変わってしまうことを指す
