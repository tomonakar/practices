package main

import "fmt"

// ベースの構造体定義
type Person struct {
	name, position string
}

// 1つの変更操作を表す関数型
type personMod func(*Person)

// ビルダー構造体
type PersonBuilder struct {
	// 変更操作を格納するスライス
	actions []personMod
}

// 名前を設定するビルダー構造体のメソッド
func (b *PersonBuilder) Called(name string) *PersonBuilder {
	b.actions = append(b.actions, func(p *Person) {
		p.name = name
	})
	return b
}

// 役職を設定するビルダー構造体のメソッド
func (b *PersonBuilder) WorksAsA(position string) *PersonBuilder {
	b.actions = append(b.actions, func(p *Person) {
		p.position = position
	})
	return b
}

// 最終的なビルドメソッド
func (b *PersonBuilder) Build() *Person {
	// 新しいPersonインスタンスを作成
	p := Person{}

	// スライスに格納された変更操作を実行
	for _, a := range b.actions {
		a(&p)
	}
	return &p
}

func main() {
	b := PersonBuilder{}
	p := b.Called("Dmitri").WorksAsA("dev").Build()
	fmt.Println(*p)
}
