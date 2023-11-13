package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/handlers"
)

func main() {

	r := mux.NewRouter()

	r.HandleFunc("/hello", handlers.HelloHandler)
	r.HandleFunc("/article", handlers.PostArticleHandler)
	r.HandleFunc("/article/list", handlers.GetArticleListHandler)
	r.HandleFunc("/article/", handlers.GetArticleByIdHandler)
	r.HandleFunc("/article/nice", handlers.ArticleNiceHandler)
	r.HandleFunc("/comment", handlers.PostCommentHandler)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
