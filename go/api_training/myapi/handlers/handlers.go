package handlers

import (
	"fmt"
	"io"
	"net/http"
)

func NotAllowResp(w http.ResponseWriter) {
	http.Error(w, "Invalid method\n", http.StatusMethodNotAllowed)
}

// hello ハンドラ
func HelloHandler(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodGet {
		io.WriteString(w, "Hello, world!\n")
	} else {
		NotAllowResp(w)
	}
}

// article ハンドラ
func PostArticleHandler(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		io.WriteString(w, "post article\n")
	} else {
		NotAllowResp(w)
	}
}

// articleリスト ハンドラ
func GetArticleListHandler(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodGet {
		io.WriteString(w, "Article List\n")
	} else {
		NotAllowResp(w)
	}
}

// article詳細 ハンドラ
func GetArticleByIdHandler(w http.ResponseWriter, req *http.Request) {
	// /article/[:id] =>  /article/1
	id := req.URL.Path[len("/article/"):]
	if req.Method == http.MethodGet {
		io.WriteString(w, fmt.Sprintf("Article %s\n", id))
	} else {
		NotAllowResp(w)
	}
}

// articleいいね ハンドラ
func ArticleNiceHandler(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		io.WriteString(w, "Article Nice\n")
	} else {
		NotAllowResp(w)
	}
}

func PostCommentHandler(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		io.WriteString(w, "post comment\n")
	} else {
		NotAllowResp(w)
	}
}
