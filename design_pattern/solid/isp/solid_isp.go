package main

/// ISP (Interface Segregation Principle)
/// 1. 大きなインターフェースを小さなインターフェースに分割する
/// 2. クライアントが利用しないメソッドに依存しないようにする

type Document struct {
}

// ISP違反
type Machine interface {
	Print(d Document)
	Fax(d Document)
	Scan(d Document)
}

// 複数のデバイスが必要な場合
type MultiFunctionPrinter struct {
	// ...
}

func (m MultiFunctionPrinter) Print(d Document) {

}

func (m MultiFunctionPrinter) Fax(d Document) {

}

func (m MultiFunctionPrinter) Scan(d Document) {

}

type OldFashionedPrinter struct {
	// ...
}

func (o OldFashionedPrinter) Print(d Document) {
	// ok
}

func (o OldFashionedPrinter) Fax(d Document) {
	panic("operation not supported")
}

// Deprecated: ...
func (o OldFashionedPrinter) Scan(d Document) {
	panic("operation not supported")
}

// LSPに従って、必要な単位にインターフェースを分割
type Printer interface {
	Print(d Document)
}

// LSPに従って、必要な単位にインターフェースを分割
type Scanner interface {
	Scan(d Document)
}

// printer only
type MyPrinter struct {
	// ...
}

func (m MyPrinter) Print(d Document) {
	// ...
}

// インターフェースを組み合わせる
type Photocopier struct{}

func (p Photocopier) Scan(d Document) {
	//
}

func (p Photocopier) Print(d Document) {
	//
}

type MultiFunctionDevice interface {
	Printer
	Scanner
}

// interface combination + decorator
// 既存のインターフェースを組み合わせ、新しいインターフェースを作成することで
// 既存コードに変更を加えずに新しい機能を追加する
type MultiFunctionMachine struct {
	printer Printer
	scanner Scanner
}

func (m MultiFunctionMachine) Print(d Document) {
	m.printer.Print(d) // プリンター機能を移譲
}

func (m MultiFunctionMachine) Scan(d Document) {
	m.scanner.Scan(d) // スキャナー機能を移譲
}

func main() {

}
