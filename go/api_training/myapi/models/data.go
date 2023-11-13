package models

import "time"

var (
	Comment1 = Comment{
		CommentID: 1,
		ArticleID: 1,
		Message:   "test comment1",
		CreatedAt: time.Now(),
	}

	Comment2 = Comment{
		CommentID: 2,
		ArticleID: 2,
		Message:   "test comment2",
		CreatedAt: time.Now(),
	}
)

var (
	Article1 = Article{
		ID:          1,
		Title:       "first article",
		Contents:    "this is the test article",
		UserName:    "tomonakar",
		NiceNum:     1,
		CommentList: []Comment{Comment1, Comment2},
		CreatedAt:   time.Now(),
	}
	Article2 = Article{
		ID:        2,
		Title:     "second article",
		Contents:  "this is the test article",
		UserName:  "tomonakar",
		NiceNum:   2,
		CreatedAt: time.Now(),
	}
)
