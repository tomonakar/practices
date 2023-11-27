package services

import (
	"github.com/tomonakar/go_api_training/models"
	"github.com/tomonakar/go_api_training/repositories"
)

// GetArticleService - 指定IDの記事情報を取得する
func GetArticleService(articleID int) (models.Article, error) {
	db, err := connectDB()
	if err != nil {
		return models.Article{}, err
	}
	defer db.Close()

	// 1. repositories 層の関数 SelectArticleDetail で記事の詳細を取得する
	article, err := repositories.SelectArticleDetail(db, articleID)
	if err != nil {
		return models.Article{}, err
	}

	// 2. repositories層の関数 SelectCommentListでコメント一覧を取得する
	commentList, err := repositories.SelectCommentList(db, articleID)
	if err != nil {
		return models.Article{}, err
	}

	// 3. 2で得たコメント一覧を1で取得したarticle構造他に追加する
	article.CommentList = append(article.CommentList, commentList...)

	return article, nil
}

// PostArticleService - 記事を投稿する
func PostArticleService(article models.Article) (models.Article, error) {
	// 0. db接続
	db, err := connectDB()
	if err != nil {
		return models.Article{}, err
	}
	defer db.Close()

	// 1. repositories層の関数 InsertArticle で記事を投稿する

	return models.Article{}, nil
}

// GetArticleListService - 記事一覧を取得する
func GetArticleListService(page int) ([]models.Article, error) {
	return []models.Article{}, nil
}

// PostNiceService - 記事にいいねをする
func PostNiceService(article models.Article) (models.Article, error) {
	return models.Article{}, nil
}
