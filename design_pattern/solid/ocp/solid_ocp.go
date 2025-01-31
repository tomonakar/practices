package main

/// OCP (Open/Closed Principle)
/// 1. ソフトウェアエンティティ（クラス、モジュール、関数など）は拡張に対して開いているべき
/// 2. 既存のコードを変更することなく、新しい機能を追加できるようにするべき

import "fmt"

type Color int

const (
	red Color = iota
	green
	blue
)

type Size int

const (
	small Size = iota
	medium
	large
)

type Product struct {
	name  string
	color Color
	size  Size
}

type Filter struct {
}

// FilterByColor filters products by color
func (f *Filter) filterByColor(products []Product, color Color) []*Product {
	result := make([]*Product, 0)

	for i, v := range products {
		if v.color == color {
			result = append(result, &products[i])
		}
	}
	return result
}

// FilterBySize filters products by size
func (f *Filter) FilterBySize(products []Product, size Size) []*Product {
	result := make([]*Product, 0)

	for i, v := range products {
		if v.size == size {
			result = append(result, &products[i])
		}
	}
	return result
}

// FilterBySizeAndColor filters products by size and color
func (f *Filter) FilterBySizeAndColor(products []Product, size Size, color Color) []*Product {
	result := make([]*Product, 0)

	for i, v := range products {
		if v.size == size && v.color == color {
			result = append(result, &products[i])
		}
	}
	return result
}

/// Filter構造体はOCP原則に違反
/// 1. 拡張性の欠如
///  - Filter構造体に新しいメソッドを追加するたびに、Filter構造体に変更を加える必要がある
///  - 例) 重さによるフィルタリングを追加する場合
///    - FilterByWeight
///    - FilterByWeightAndColor
///    - FilterByWeightAndSize
///    ...のようにメソッドが幾何級数的に増える
/// 2. 修正の必要性
///  - Filter構造体に変更を加えるたびに、既存のコードを修正する必要が生じる
///  - 既存コードのテストが必要になる

// / 改善策： OCP原則を適用するために、Specificationパターンを使用する
type Specification interface {
	IsSatisfied(p *Product) bool
}

type ColorSpecification struct {
	color Color
}

func (spec ColorSpecification) IsSatisfied(p *Product) bool {
	return p.color == spec.color
}

type SizeSpecification struct {
	size Size
}

func (spec SizeSpecification) IsSatisfied(p *Product) bool {
	return p.size == spec.size
}

type AndSpecification struct {
	first, second Specification
}

func (spec AndSpecification) IsSatisfied(p *Product) bool {
	return spec.first.IsSatisfied(p) && spec.second.IsSatisfied(p)
}

type BetterFilter struct{}

func (f BetterFilter) Filter(products []Product, spec Specification) []*Product {
	result := make([]*Product, 0)
	for i, v := range products {
		if spec.IsSatisfied(&v) {
			result = append(result, &products[i])
		}
	}
	return result
}

func main() {
	apple := Product{"Apple", green, small}
	tree := Product{"Tree", green, large}
	house := Product{"House", blue, large}

	products := []Product{apple, tree, house}

	fmt.Print("Green products (old):\n")
	f := Filter{}
	for _, v := range f.filterByColor(products, green) {
		fmt.Printf(" - %s is green\n", v.name)
	}
	// ^ BEFORE

	// v AFTER
	fmt.Print("Green products (new):\n")
	greenSpec := ColorSpecification{green}
	bf := BetterFilter{}
	for _, v := range bf.Filter(products, greenSpec) {
		fmt.Printf(" - %s is green\n", v.name)
	}

	largeSpec := SizeSpecification{large}
	largeGreenSpec := AndSpecification{largeSpec, greenSpec}
	fmt.Print("Large green items:\n")
	for _, v := range bf.Filter(products, largeGreenSpec) {
		fmt.Printf(" - %s is large and green\n", v.name)
	}
}
