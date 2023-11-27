package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"

	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/controllers"
	"github.com/tomonakar/go_api_training/services"
)

var (
	dbUser     = os.Getenv("DB_USER")
	dbPassword = os.Getenv("DB_PASSWORD")
	dbDatabase = os.Getenv("DB_NAME")
	dbConn     = fmt.Sprintf("%s:%s@tcp(127.0.0.1:3306)/%s?parseTime=true", dbUser, dbPassword, dbDatabase)
)

func main() {
	// サーバ全体で使用するsql.DBを１つ生成
	db, err := sql.Open("mysql", dbConn)
	if err != nil {
		log.Println("fail to connect db")
		return
	}

	// サーバ全体で使用するサービスを１つ生成
	ser := services.NewMyAppService(db)
	// サーバ全体で使用するコントローラーを１つ生成
	con := controllers.NewMyAppController(ser)

	// コントローラとルーティングを紐付け
	r := mux.NewRouter()
	r.HandleFunc("/hello", con.HelloHandler).Methods(http.MethodGet)
	r.HandleFunc("/article", con.PostArticleHandler).Methods(http.MethodPost)
	r.HandleFunc("/article/list", con.ArticleListHandler).Methods(http.MethodGet)
	r.HandleFunc("/article/{id:[0-9]+}", con.ArticleDetailHandler).Methods(http.MethodGet)
	r.HandleFunc("/article/nice", con.PostNiceHandler).Methods(http.MethodPost)
	r.HandleFunc("/comment", con.PostCommentHandler).Methods(http.MethodPost)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
