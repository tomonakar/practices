package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"

	"github.com/tomonakar/go_api_training/controllers"
	"github.com/tomonakar/go_api_training/routers"
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
	aCon := controllers.NewArticleController(ser)
	cCon := controllers.NewCommentController(ser)

	// コントローラとルーティングを紐付け
	r := routers.NewRouter(aCon, cCon)

	log.Println("server start at port 8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
