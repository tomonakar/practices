package controllers_test

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"testing"

	_ "github.com/go-sql-driver/mysql"
	"github.com/tomonakar/go_api_training/controllers"
	"github.com/tomonakar/go_api_training/services"
)

// 1. テストに利用するリソースを用意
var aCon *controllers.ArticleController

// testing.Mは、テストを実行するためのメソッドを提供する
// TestMainでtesting.Mを受け取り、m.Run()を実行することでテストを実行する
func TestMain(m *testing.M) {
	dbUser := "docker"
	dbPassword := "docker"
	dbDatabase := "sampledb"
	dbConn := fmt.Sprintf("%s:%s@tcp(127.0.0.1:3306)/%s?parseTime=true", dbUser, dbPassword, dbDatabase)

	db, err := sql.Open("mysql", dbConn)
	if err != nil {
		log.Println("DB setup fail")
		os.Exit(1)
	}

	ser := services.NewMyAppService(db)
	aCon = controllers.NewArticleController(ser)

	// 3. テストを実行
	m.Run()
}
