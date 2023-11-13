package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/handlers"
)

func main() {

	type Comment struct {
		CommentID int       `json:"comment_id"`
		ArticleID int       `json:"article_id"`
		Message   string    `json:"message"`
		CreatedAt time.Time `json:"created_at"`
	}

	type Article struct {
		ID          int       `json:"id"`
		Title       string    `json:"title"`
		Contents    string    `json:"contents"`
		UserName    string    `json:"user_name"`
		NiceNum     int       `json:"nice_num"`
		CommentList []Comment `json:"comment_list"`
		CreatedAt   time.Time `json:"created_at"`
	}

	comment1 := Comment{
		CommentID: 1,
		ArticleID: 1,
		Message:   "test comment1",
		CreatedAt: time.Now(),
	}

	comment2 := Comment{
		CommentID: 2,
		ArticleID: 2,
		Message:   "test comment2",
		CreatedAt: time.Now(),
	}

	article := Article{
		ID:          1,
		Title:       "first article",
		Contents:    "this is the test article",
		UserName:    "tomonakar",
		NiceNum:     0,
		CommentList: []Comment{comment1, comment2},
		CreatedAt:   time.Now(),
	}

	fmt.Printf("%+v\n", article)

	// json.Marshalで構造体をjsonに変換
	jsonData, err := json.Marshal(article)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Printf("%s\n", jsonData)

	r := mux.NewRouter()

	r.HandleFunc("/hello", handlers.HelloHandler).Methods(http.MethodGet)
	r.HandleFunc("/article", handlers.PostArticleHandler).Methods(http.MethodPost)
	r.HandleFunc("/article/list", handlers.GetArticleListHandler).Methods(http.MethodGet)
	r.HandleFunc("/article/{id:[0-9]+}", handlers.GetArticleByIdHandler).Methods(http.MethodGet)
	r.HandleFunc("/article/nice", handlers.ArticleNiceHandler).Methods(http.MethodPost)
	r.HandleFunc("/comment", handlers.PostCommentHandler).Methods(http.MethodPost)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
