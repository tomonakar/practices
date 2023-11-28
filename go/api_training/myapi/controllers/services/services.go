package services

import "github.com/tomonakar/go_api_training/models"

// ArticleServer - Articleに関するサービスを定義
type ArticleServer interface {
	PostArticleService(article models.Article) (models.Article, error)
	GetArticleListService(page int) ([]models.Article, error)
	GetArticleService(articleID int) (models.Article, error)
	PostNiceService(article models.Article) (models.Article, error)
}

// CommentServer - Commentに関するサービスを定義
type CommentServer interface {
	PostCommentService(comment models.Comment) (models.Comment, error)
}
