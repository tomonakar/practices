package handlers

import (
	"fmt"
	"io"
	"net/http"
)

// hello ハンドラ
func HelloHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Hello, world!\n")
}

// article ハンドラ
func PostArticleHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "post article\n")
}

// articleリスト ハンドラ
func GetArticleListHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Article List\n")
}

// article詳細 ハンドラ
func GetArticleByIdHandler(w http.ResponseWriter, req *http.Request) {
	// /article/[:id] =>  /article/1
	id := req.URL.Path[len("/article/"):]
	io.WriteString(w, fmt.Sprintf("Article %s\n", id))
}

// articleいいね ハンドラ
func GetArticleNiceHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Article Nice\n")
}

// comment ハンドラ
func PostCommentHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "post comment\n")
}
