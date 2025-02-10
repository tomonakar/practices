package main

import "fmt"

type Address struct {
	StreetAddress, City, Country string
}

func (a *Address) DeepCopy() *Address {
	return &Address{
		a.StreetAddress,
		a.City,
		a.Country}
}

type Person struct {
	Name    string
	Address *Address
	Friends []string
}

func (p *Person) DeepCopy() *Person {
	q := *p // pがさすPersonの値全体を取得（デリファレンス）
	q.Address = p.Address.DeepCopy()
	copy(q.Friends, p.Friends) // p.Friendsの値をq.Friendsにdeep copy
	return &q                  // qのアドレスを返す
}

func main() {
	john := Person{"John",
		&Address{"123 London Rd", "London", "UK"},
		[]string{"Chris", "Matt"}}

	jane := john.DeepCopy()
	jane.Name = "Jane"
	jane.Address.StreetAddress = "321 Baker St"
	jane.Friends = append(jane.Friends, "Angela")

	fmt.Println(john, john.Address)
	fmt.Println(jane, jane.Address)
}
