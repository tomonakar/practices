package repositories_test

import (
	"testing"

	"github.com/tomonakar/go_api_training/models"
	"github.com/tomonakar/go_api_training/repositories"
	"github.com/tomonakar/go_api_training/repositories/testdata"
)

// SelectCommentListのテスト
func TestSelectCommentList(t *testing.T) {
	articleID := 1
	got, err := repositories.SelectCommentList(testDB, articleID)
	if err != nil {
		t.Fatal(err)
	}

	for _, comment := range got {
		if comment.ArticleID != articleID {
			t.Errorf("want %d but got %d\n", articleID, comment.ArticleID)
		}
	}
}

// InsertCommentのテスト
func TestInsertComment(t *testing.T) {
	comment := models.Comment{
		ArticleID: 1,
		Message:   "test comment",
	}

	got, err := repositories.InsertComment(testDB, comment)
	if err != nil {
		t.Error(err)
	}

	expectedCommentID := len(testdata.CommentTestData) + 1
	if got.CommentID != expectedCommentID {
		t.Errorf("want %d but got %d\n", expectedCommentID, got.CommentID)
	}

	t.Cleanup(func() {
		const sqlStr = `
			delete from comments
			where message = ? article_id = ?;
		`

		testDB.Exec(sqlStr, comment.Message, comment.ArticleID)
	})
}
