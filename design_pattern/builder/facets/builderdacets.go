package main

// 複数の側面（facets）を持つビルダー
// - 複数の異なる属性・グループを持つオブジェクトの構築に適している
//
// メリット：
// - メソッドチェーン可能な流暢なインターフェースを提供
// - 関連する属性をグループ化し、それぞれの属性に対して専門家されたビルダーを提供
// - コードの可読性を向上させる
// - 構築プロセスを制御し、オブジェクトの生成を柔軟にする

import "fmt"

// メインの構造体
type Person struct {
	StreetAddress, Postcode, City string
	CompanyName, Position         string
	AnnualIncome                  int
}

// ベースとなるビルダー
type PersonBuilder struct {
	person *Person
}

func NewPersonBuilder() *PersonBuilder {
	return &PersonBuilder{&Person{}}
}

func (it *PersonBuilder) Build() *Person {
	return it.person
}

func (it *PersonBuilder) Works() *PersonJobBuilder {
	return &PersonJobBuilder{*it}
}

func (it *PersonBuilder) Lives() *PersonAddressBuilder {
	return &PersonAddressBuilder{*it}
}

// 専門家されたビルダー（仕事に関する情報）
type PersonJobBuilder struct {
	PersonBuilder
}

func (pjb *PersonJobBuilder) At(companyName string) *PersonJobBuilder {
	pjb.person.CompanyName = companyName
	return pjb
}

func (pjb *PersonJobBuilder) AsA(position string) *PersonJobBuilder {
	pjb.person.Position = position
	return pjb
}

func (pjb *PersonJobBuilder) Earning(annualIncome int) *PersonJobBuilder {
	pjb.person.AnnualIncome = annualIncome
	return pjb
}

// 専門家されたビルダー（住所に関する情報）
type PersonAddressBuilder struct {
	PersonBuilder
}

func (pab *PersonAddressBuilder) At(streetAddress string) *PersonAddressBuilder {
	pab.person.StreetAddress = streetAddress
	return pab
}

func (it *PersonAddressBuilder) In(city string) *PersonAddressBuilder {
	it.person.City = city
	return it
}

func (it *PersonAddressBuilder) WithPostcode(postcode string) *PersonAddressBuilder {
	it.person.Postcode = postcode
	return it
}

func main() {
	pb := NewPersonBuilder()
	pb.Lives().
		At("123 London Road").
		In("London").
		WithPostcode("SW12BC").
		Works().
		At("Fabrikam").
		AsA("Programmer").
		Earning(123000)
	p := pb.Build()
	fmt.Println(*p)
}
