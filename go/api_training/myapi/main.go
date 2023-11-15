package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"github.com/tomonakar/go_api_training/handlers"
	"github.com/tomonakar/go_api_training/models"
)

func main() {
	dbUser := "docker"
	dbPassword := "docker"
	dbDatabase := "sampledb"
	// db接続のための文字列を作成
	dbConn := fmt.Sprintf("%s:%s@tcp(127.0.0.1:3306)/%s?parseTime=true", dbUser, dbPassword, dbDatabase)

	// sql.Openの第一引数はドライバ名で、各パッケージによって異なる
	// 詳細は各パッケージのドキュメントを参照
	// @see - https://github.com/go-sql-driver/mysql
	db, err := sql.Open("mysql", dbConn)
	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()

	// トランザクションの開始
	tx, err := db.Begin()
	if err != nil {
		fmt.Println(err)
		return
	}

	// 現在のいいね数を取得する
	article_id := 1
	const sqlGetNiceNum = `
		select nice
		from articles
		where article_id = ?;
	`

	row := tx.QueryRow(sqlGetNiceNum, article_id)
	if err := row.Err(); err != nil {
		fmt.Println(err)
		tx.Rollback()
		return
	}

	// 変数 nicenumにいいね数を読み込む
	var nicenum int
	err = row.Scan(&nicenum)
	if err != nil {
		fmt.Println(err)
		tx.Rollback()
		return
	}

	// いいね数を+1する高k新処理を行う
	const sqlUpdateNiceNum = `
		update articles
		set nice = ?
		where article_id = ?;
	`
	_, err = tx.Exec(sqlUpdateNiceNum, nicenum+1, article_id)
	if err != nil {
		fmt.Println(err)
		tx.Rollback()
		return
	}

	// コミットして処理内容を確定する
	tx.Commit()

	// データを挿入する処理
	// 記事データをEXECメソッドでinsertする
	articleI := models.Article{
		Title:    "insert test",
		Contents: "Can I insert data correctly?",
		UserName: "tomonakar",
	}

	const sqlStr2 = `
		insert into articles (title, contents, username, nice, created_at) values
		(?, ?, ?, 0, now());
	`
	result, err := db.Exec(sqlStr2, articleI.Title, articleI.Contents, articleI.UserName)
	if err != nil {
		fmt.Println(err)
		return
	}

	// result.LastInsertId()で、AUTO_INCREMENTの値を取得できる
	fmt.Println(result.LastInsertId())
	// result.RowsAffected()で、クエリ実行時に影響を受けた行数を取得できる
	fmt.Println(result.RowsAffected())

	// クエリ定義
	// Note: ?はプレースホルダーで、実行時に値を埋め込む。プレースホルダーはドライバーによって異なる
	// Note: プレースホルダーはSQLインジェクション対策にもなるため、fmt.Printfなどで動的にクエリを組み立てるのではなく、プレースホルダーを使うこと35G1
	articleID := 1
	const sqlStr = `
		select *
		from articles
		where article_id = ?;
`

	// クエリ実行
	// db.QueryRowは、クエリ実行結果を1行だけ取得する
	row := db.QueryRow(sqlStr, articleID)
	if err := row.Err(); err != nil {
		fmt.Println(err)
		return
	}

	// rows.Next()で次の行があるかどうかを確認
	// 次の行がある場合は、rows.Scan()で各カラムの値を取得
	var article models.Article
	var createdTime sql.NullTime
	// rows.Scanは、引数に「データ読み出し結果を格納したい変数のポインタ」を指定することで、取得レコードの中身を読み出すことができる
	err = row.Scan(&article.ID, &article.Title, &article.Contents, &article.UserName, &article.NiceNum, &createdTime)
	if err != nil {
		// データ取得件数が0件の場合は、sql.ErrNoRowsが返ってくるので、データ読み出し処理には入らず終了する
		fmt.Println(err)
		return
	}

	if createdTime.Valid {
		article.CreatedAt = createdTime.Time
	}

	fmt.Printf("%+v\n", article)

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
