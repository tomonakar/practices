package controllers

import "github.com/tomonakar/go_api_training/controllers/services"

// CommentController - Commentに関するコントローラを定義
type CommentController struct {
	service services.CommentServer
}

// NewCommentController - CommentControllerを初期化
func NewCommentController(s services.CommentServer) *CommentController {
	return &CommentController{
		service: s,
	}
}
