package handlers

import (
	"encoding/json"
	"io"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/models"
	"github.com/tomonakar/go_api_training/services"
)

// Get /hello ハンドラ
func HelloHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Hello, world!\n")
}

// Post /article ハンドラ
func PostArticleHandler(w http.ResponseWriter, req *http.Request) {

	var reqArticle models.Article
	if err := json.NewDecoder(req.Body).Decode(&reqArticle); err != nil {
		http.Error(w, "fail to decode json\n", http.StatusBadRequest)
		return
	}

	article, err := services.PostArticleService(reqArticle)
	if err != nil {
		http.Error(w, "fail internal exec\n", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(article)
}

// GET /article/list ハンドラ
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

	articleList, err := services.GetArticleListService(page)
	if err != nil {
		http.Error(w, "fail internal exec\n", http.StatusInternalServerError)
	}
	json.NewEncoder(w).Encode(articleList)
}

// GET /article/{id} ハンドラ
func ArticleDetailHandler(w http.ResponseWriter, req *http.Request) {
	// mux.Vars(req)でパスパラメータを MAP形式で取得できる
	// 今回はidを取得するので、idをキーにして値を取得する
	articleID, err := strconv.Atoi(mux.Vars(req)["id"])
	if err != nil {
		http.Error(w, "Invalid article ID", http.StatusBadRequest)
		return
	}

	article, err := services.GetArticleListService(articleID)
	if err != nil {
		http.Error(w, "fail internal exec\n", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(article)
}

// POST /article/nice ハンドラ
func ArticleNiceHandler(w http.ResponseWriter, req *http.Request) {
	var reqArticle models.Article
	if err := json.NewDecoder(req.Body).Decode(&reqArticle); err != nil {
		http.Error(w, "fail to decode json\n", http.StatusBadRequest)
		return
	}

	article, err := services.PostNiceService(reqArticle)
	if err != nil {
		http.Error(w, "fail internal exec\n", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(article)
}

// Post /comment ハンドラ
func PostCommentHandler(w http.ResponseWriter, req *http.Request) {
	var comment models.Comment
	err := json.NewDecoder(req.Body).Decode(&comment)
	if err != nil {
		http.Error(w, "fail to decode json\n", http.StatusBadRequest)
		return
	}

	comment, err = services.PostCommentService(comment)
	if err != nil {
		http.Error(w, "fail internal exec\n", http.StatusInternalServerError)
		return
	}

	json.NewEncoder(w).Encode(comment)
}
