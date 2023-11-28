package controllers_test

import (
	"fmt"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestArticleListHandler(t *testing.T) {
	// 2. テストデータを用意
	var tests = []struct {
		name       string
		query      string
		resultCode int
	}{
		{name: "number query", query: "1", resultCode: http.StatusOK},
		{name: "alphabet query", query: "a", resultCode: http.StatusBadRequest},
	}

	// 3. テストを実行
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			// テストで利用するリクエストを作成
			url := fmt.Sprintf("http://localhost:8080/article/list?page=%s", tt.query)
			req := httptest.NewRequest("GET", url, nil)
			res := httptest.NewRecorder()
			// 3 テスト対象のハンドラを呼び出す
			aCon.ArticleListHandler(res, req)
			// 4. テスト結果を検証
			if res.Code != tt.resultCode {
				t.Errorf("unexpected StatusCode: want %d but %d\n", tt.resultCode, res.Code)
			}
		})
	}
}
