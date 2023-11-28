package controllers

import "github.com/tomonakar/go_api_training/controllers/services"

// ArticleController - Articleに関するコントローラを定義
type ArticleController struct {
	service services.ArticleServer
}

// NewArticleController - ArticleControllerを初期化
func NewArticleController(s services.ArticleServer) *ArticleController {
	return &ArticleController{
		service: s,
	}
}
