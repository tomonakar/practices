package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/models"
)

// hello ハンドラ
func HelloHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Hello, world!\n")
}

// article ハンドラ
func PostArticleHandler(w http.ResponseWriter, req *http.Request) {
	article := models.Article1
	jsonData, err := json.Marshal(article)
	if err != nil {
		http.Error(w, "fail to encode json\n", http.StatusInternalServerError)
	}

	w.Write(jsonData)
}

// articleリスト ハンドラ
func GetArticleListHandler(w http.ResponseWriter, req *http.Request) {
	// GET /article/list?page=X でpageを指定して記事一覧を取得する
	queryMap := req.URL.Query()

	var page int

	// pageに指定が複数ある場合は最初の値を取得する
	if p, ok := queryMap["page"]; ok && len(p) > 0 {
		var err error
		// 数値変換できない値の場合はエラーを返す
		page, err = strconv.Atoi(p[0])
		if err != nil {
			http.Error(w, "Invalid page parameter", http.StatusBadRequest)
			return
		}
		// パラメータ pageの指定がない場合はpage=1とする
	} else {
		page = 1
	}

	articleList := []models.Article{models.Article1, models.Article2}
	jsonData, err := json.Marshal(articleList)
	if err != nil {
		errMsg := fmt.Sprintf("fail to encode json page %d\n", page)
		http.Error(w, errMsg, http.StatusInternalServerError)
	}

	w.Write(jsonData)
}

// article詳細 ハンドラ
func GetArticleByIdHandler(w http.ResponseWriter, req *http.Request) {
	// mux.Vars(req)でパスパラメータを MAP形式で取得できる
	// 今回はidを取得するので、idをキーにして値を取得する
	articleID, err := strconv.Atoi(mux.Vars(req)["id"])
	if err != nil {
		http.Error(w, "Invalid article ID", http.StatusBadRequest)
		return
	}
	resString := fmt.Sprintf("Article ID is %d\n", articleID)

	article := models.Article1
	jsonData, err := json.Marshal(article)
	if err != nil {
		http.Error(w, "fail to encode json\n", http.StatusInternalServerError)
	}
	w.Write(jsonData)

	io.WriteString(w, resString)
}

// articleいいね ハンドラ
func ArticleNiceHandler(w http.ResponseWriter, req *http.Request) {
	jsonData, err := json.Marshal(models.Article1)
	if err != nil {
		http.Error(w, "fail to encode json\n", http.StatusInternalServerError)
	}
	w.Write(jsonData)
}

func PostCommentHandler(w http.ResponseWriter, req *http.Request) {
	comment := models.Comment1
	jsonData, err := json.Marshal(comment)
	if err != nil {
		http.Error(w, "fail to encode json\n", http.StatusInternalServerError)
	}
	w.Write(jsonData)
}
