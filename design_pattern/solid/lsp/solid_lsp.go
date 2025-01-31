package main

import "fmt"

/// LSP (Liskov Substitution Principle)
/// - サブタイプは、そのすーパータイプと置き換え可能でなければならない
/// - プログラムの正当性を保証するために、サブタイプはそのスーパータイプの仕様を満たす必要がある
///
/// LSP違反の例：
/// 1. Square構造体がRectangleを埋め込んでいるが、正方形の性質（幅と高さが等しい）を
///    保つために、SetWidthとSetHeightメソッドで両方の値を変更している
/// 2. UseIt関数は長方形の振る舞いを前提としているため、Squareを渡すと
///    期待される面積と実際の面積が異なる結果となる
/// 3. これは「置換原則」に違反している典型的な例で、SquareがRectangleの
///    代わりに使用できない（つまり置換できない）ことを示している
///
/// - Go言語には継承がないため、サブタイプの概念がないが、インターフェースを使ってLSPを実現できる
/// - 以下の例では、RectangleとSquareがSizedインターフェースを実装している

type Sized interface {
	GetWidth() int
	SetWidth(width int)
	GetHeight() int
	SetHeight(height int)
}

type Rectangle struct {
	width, height int
}

// vvv !! POINTER
func (r *Rectangle) GetWidth() int {
	return r.width
}

func (r *Rectangle) SetWidth(width int) {
	r.width = width
}

func (r *Rectangle) GetHeight() int {
	return r.height
}

func (r *Rectangle) SetHeight(height int) {
	r.height = height
}

// LSP修正版
type Square struct {
	Rectangle
}

func NewSquare(size int) *Square {
	sq := Square{}
	sq.width = size
	sq.height = size
	return &sq
}

func (s *Square) SetWidth(width int) {
	s.width = width
	s.height = width
}

func (s *Square) SetHeight(height int) {
	s.width = height
	s.height = height
}

type Square2 struct {
	size int
}

func (s *Square2) Rectangle() Rectangle {
	return Rectangle{s.size, s.size}
}

// UseIt関数はSizedインターフェースを引数に取る
func UseIt(sized Sized) {
	width := sized.GetWidth()
	sized.SetHeight(10)
	expectedArea := 10 * width
	actualArea := sized.GetWidth() * sized.GetHeight()
	fmt.Print("Expected an area of ", expectedArea,
		", but got ", actualArea, "\n")
}

func main() {
	rc := &Rectangle{2, 3}
	UseIt(rc)

	sq := NewSquare(5)
	UseIt(sq)
}
