package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	helloHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "Hello, world!\n")
	}

	postArticleHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "post article\n")
	}

	getArticleListHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "Article List\n")
	}

	getArticleByIdHandler := func(w http.ResponseWriter, req *http.Request) {
		// /article/[:id] =>  /article/1
		id := req.URL.Path[len("/article/"):]
		io.WriteString(w, fmt.Sprintf("Article %s\n", id))
	}

	getArticleNiceHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "Article Nice\n")
	}

	postCommentHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "post comment\n")
	}

	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/article", postArticleHandler)
	http.HandleFunc("/article/list", getArticleListHandler)
	http.HandleFunc("/article/", getArticleByIdHandler)
	http.HandleFunc("/article/nice", getArticleNiceHandler)
	http.HandleFunc("/comment", postCommentHandler)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
