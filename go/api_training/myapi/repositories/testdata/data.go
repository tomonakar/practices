package testdata

import "github.com/tomonakar/go_api_training/models"

var ArticleTestData = []models.Article{
	models.Article{
		ID:       1,
		Title:    "firstPost",
		Contents: "This is my first blog",
		UserName: "tomonakar",
		NiceNum:  2,
	}, {
		ID:       2,
		Title:    "2nd",
		Contents: "Second blog post",
		UserName: "tomonakar",
		NiceNum:  4,
	},
}

var CommentTestData = []models.Comment{
	models.Comment{
		CommentID: 1,
		ArticleID: 1,
		Message:   "1st comment yeah",
	},
	models.Comment{
		CommentID: 2,
		ArticleID: 1,
		Message:   "welcome",
	},
}
