package main

import (
	"log"
	"net/http"

	"github.com/tomonakar/go_api_training/handlers"
)

func main() {

	http.HandleFunc("/hello", handlers.HelloHandler)
	http.HandleFunc("/article", handlers.PostArticleHandler)
	http.HandleFunc("/article/list", handlers.GetArticleListHandler)
	http.HandleFunc("/article/", handlers.GetArticleByIdHandler)
	http.HandleFunc("/article/nice", handlers.ArticleNiceHandler)
	http.HandleFunc("/comment", handlers.PostCommentHandler)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
