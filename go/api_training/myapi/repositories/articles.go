package repositories

import (
	"database/sql"
	"fmt"

	"github.com/tomonakar/go_api_training/models"
)

// 新規投稿をデータベースにinsertする関数
func InsertArticle(db *sql.DB, article models.Article) (models.Article, error) {
	const sqlStr = `
		insert into articles (title, contents, username, nice, created_at) values
		(?, ?, ?, 0, now())
	`

	var newArticle models.Article
	newArticle.Title, newArticle.Contents, newArticle.UserName, newArticle.NiceNum = article.Title, article.Contents, article.UserName, article.NiceNum

	result, err := db.Exec(sqlStr, article.Title, article.Contents, article.UserName)
	if err != nil {
		fmt.Println(err)
		return models.Article{}, err
	}

	id, _ := result.LastInsertId()

	newArticle.ID = int(id)

	return newArticle, nil
}

// pageで指定されたページに表示する記事一覧を取得する関数
func SelectArticleList(db *sql.DB, page int) ([]models.Article, error) {
	const sqlStr = `
		select article_id, title, contents, username, nice
		from articles
		limit ? offset ?;
	`

	// pageで指定されたページに表示する記事一覧を取得
	rows, err := db.Query(sqlStr, 5, (page-1)*5)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	defer rows.Close()

	articleArray := make([]models.Article, 0)
	for rows.Next() {
		var article models.Article
		rows.Scan(&article.ID, &article.Title, &article.Contents, &article.UserName, &article.NiceNum)
		articleArray = append(articleArray, article)
	}
	return articleArray, nil
}

// articleIDで指定された記事の詳細を取得する関数
func SelectArticleDetail(db *sql.DB, articleID int) (models.Article, error) {
	const sqlStr = `
		select *
		from articles
		where article_id = ?;
	`

	row := db.QueryRow(sqlStr, articleID)
	if err := row.Err(); err != nil {
		fmt.Println(err)
		return models.Article{}, err
	}

	var article models.Article
	var createdTime sql.NullTime
	err := row.Scan(&article.ID, &article.Title, &article.Contents, &article.UserName, &article.NiceNum, &createdTime)
	if err != nil {
		return models.Article{}, err
	}

	if createdTime.Valid {
		article.CreatedAt = createdTime.Time
	}
	return article, nil
}

// いいねの数をupdateする関数
func UpdateNiceNum(db *sql.DB, articleID int) error {
	tx, err := db.Begin()
	if err != nil {
		return err
	}

	const sqlStr = `
		select nice
		from articles
		where article_id = ?;
	`

	row := tx.QueryRow(sqlStr, articleID)
	if err := row.Err(); err != nil {
		tx.Rollback()
		return err
	}
	var niceNum int
	row.Scan(&niceNum)

	const sqlUpdateNice = `update articles set nice = ? where article_id ?`
	_, err = db.Exec(sqlUpdateNice, niceNum+1, articleID)
	if err != nil {
		tx.Rollback()
		return err
	}

	if err := tx.Rollback(); err != nil {
		return err
	}

	return nil
}
