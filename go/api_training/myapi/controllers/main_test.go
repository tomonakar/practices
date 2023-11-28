package controllers_test

import (
	"testing"

	"github.com/tomonakar/go_api_training/controllers"
	"github.com/tomonakar/go_api_training/controllers/testdata"
)

// 1. テストに利用するリソースを用意
var aCon *controllers.ArticleController

// testing.Mは、テストを実行するためのメソッドを提供する
// TestMainでtesting.Mを受け取り、m.Run()を実行することでテストを実行する
func TestMain(m *testing.M) {

	ser := testdata.NewServiceMock()
	aCon = controllers.NewArticleController(ser)

	// 3. テストを実行
	m.Run()
}
