package main

/// DIP (Dependency Inversion Principle)
/// 1. 上位モジュールは下位レベルのモジュールに依存してはならない
/// 2. 両方とも抽象に依存すべき
/// 3. 抽象は実装に依存すべきではない
/// 4. 実装が抽象に依存すべき
///
/// Goの場合、抽象クラスや基底クラスはインターフェースを指す

import "fmt"

type Relationship int

const (
	Parent Relationship = iota
	Child
	Sibling
)

type Person struct {
	name string
}

type Info struct {
	from         *Person
	relationship Relationship
	to           *Person
}

// low-level module
type RelationshipBrowser interface {
	FindAllChildrenOf(name string) []*Person
}

// low-level module
type Relationships struct {
	relations []Info
}

func (rs *Relationships) FindAllChildrenOf(name string) []*Person {
	result := make([]*Person, 0)

	for i, v := range rs.relations {
		if v.relationship == Parent && v.from.name == name {
			result = append(result, rs.relations[i].to)
		}
	}

	return result
}

func (rs *Relationships) AddParentAndChild(parent, child *Person) {
	rs.relations = append(rs.relations, Info{parent, Parent, child})
	rs.relations = append(rs.relations, Info{child, Child, parent})
}

// high-level module
type Research struct {
	// DIP違反: low-level moduleに依存している
	// relationships Relationships
	browser RelationshipBrowser
}

func (r *Research) Investigate(parent string) {
	// DIP違反： researchモジュールがrelationshipsモジュールの内部構造に依存している
	//relations := r.relationships.relations
	//for _, rel := range relations {
	//	if rel.from.name == "John" &&
	//		rel.relationship == Parent {
	//		fmt.Println("John has a child called", rel.to.name)
	//	}
	//}

	for _, p := range r.browser.FindAllChildrenOf(parent) {
		fmt.Printf("%s has a child called %s\n", parent, p.name)
	}
}

func main() {
	parent := Person{"John"}
	child1 := Person{"Chris"}
	child2 := Person{"Matt"}

	// low-level module
	relationships := Relationships{}
	relationships.AddParentAndChild(&parent, &child1)
	relationships.AddParentAndChild(&parent, &child2)

	research := Research{&relationships}
	research.Investigate("John")
}
