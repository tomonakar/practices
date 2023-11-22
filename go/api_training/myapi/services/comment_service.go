package services

import (
	"github.com/tomonakar/go_api_training/models"
	"github.com/tomonakar/go_api_training/repositories"
)

// GetArticleService - 指定IDの記事情報を取得する
func GetArticleService(articleID int) (models.Article, error) {
	// TODO: sql.DB型を手に入れて、変数dbに代入する
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
