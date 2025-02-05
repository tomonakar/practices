package main

import (
	"fmt"
	"strings"
)

// 基本の構造体を定義
type email struct {
	from, to, subject, body string
}

// ビルダー構造体を定義
type EmailBuilder struct {
	email email
}

// 新しいビルダーを生成する関数
func NewEmailBuilder() *EmailBuilder {
	return &EmailBuilder{}
}

// ビルダーメソッドの定義
func (b *EmailBuilder) From(from string) *EmailBuilder {
	if !strings.Contains(from, "@") {
		panic("email should contain @")
	}
	b.email.from = from
	return b
}

func (b *EmailBuilder) To(to string) *EmailBuilder {
	b.email.to = to
	return b
}

func (b *EmailBuilder) Subject(subject string) *EmailBuilder {
	b.email.subject = subject
	return b
}

func (b *EmailBuilder) Body(body string) *EmailBuilder {
	b.email.body = body
	return b
}

func sendMailImpl(email *email) {
	// actually send email
	fmt.Printf("Email sent: %+v\n", email)
}

// ビルダーを操作する関数をパラメータとして受け取る関数
type build func(*EmailBuilder)

func SendEmail(action build) {
	builder := NewEmailBuilder()
	action(builder)
	sendMailImpl(&builder.email)
}

func main() {
	SendEmail(func(b *EmailBuilder) {
		b.From("alice@gmail.com").
			To("bob@gmail.com").
			Subject("hello").
			Body("Hello, Bob")
	})
}
