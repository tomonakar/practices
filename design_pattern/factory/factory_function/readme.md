# Factory Function Pattern in Go

## 概要

Factory Functionパターンは、オブジェクト生成のロジックをカプセル化するためのデザインパターンです。Goにおいて、単純な構造体の初期化は通常中括弧記法で十分ですが、より複雑な初期化ロジックが必要な場合にFactory Functionが有用です。

## ユースケース

以下のような場合にFactory Functionの使用を検討します：

1. デフォルト値の設定が必要な場合
2. オブジェクト生成時の検証が必要な場合
3. 複雑な初期化ロジックが必要な場合
4. ポインタを返す必要がある場合

## 実装例

```go
type Person struct {
    Name   string
    Age    int
    ICount int  // 目の数
}

// Factory Function
func NewPerson(name string, age int) *Person {
    return &Person{
        Name:   name,
        Age:    age,
        ICount: 2,  // デフォルト値
    }
}
```

## メリット
1. デフォルト値の制御
  - 構造体の特定のフィールドにデフォルト値を設定可能
  - コード全体で一貫した初期値を保証
2. バリデーション
  - オブジェクト生成時に値の検証が可能
  - 不正な値でのオブジェクト生成を防止
3. カプセル化
  - 生成ロジックを1箇所に集中
  - 実装の詳細を隠蔽
4. メモリ効率
  - ポインタを返すことで、大きな構造体のコピーを回避
  - メモリ使用量を最適化

## いつ使うべきか？
1. 単純な構造体の場合：
```go
p := Person{"John", 25}  // 中括弧記法で十分
```

2. 複雑な初期化が必要な場合：
```go
p := NewPerson("John", 25)  // Factory Functionを使用
```

## ベストプラクティス
1. 命名規則としてNewプレフィックスを使用
1. 必要に応じてポインタを返す
1. バリデーションロジックはFactory Function内に実装
1. デフォルト値の設定は一箇所で管理


## FactoryとBuilderの使い分け
### 主な違い
1. Factory Pattern
   - 単一の呼び出しでオブジェクトを生成
   - シンプルなオブジェクト生成に適する
   - デフォルト値の設定が主な目的

```go
func NewPerson(name string, age int) *Person {
	return &Person{
		Name: name,
		Age: age,
		ICount: 2,
	}
}

// 使用例
person := NewPerson("John", 25)
```

2. Builder Pattern
	 - 段階的な構築プロセス
	 - 複雑なオブジェクト生成に適する
	 - オプショナルなパラメーターが多い場合に有用

```go
type PersonBuilder struct {
	person *Person
}

func NewPersonBuilder() *PersonBuilder {
	return &PersonBuilder{person: &Person{Icount: 2}}
}

func (b *PersonBuilder) SetName(name string) *PersonBuilder {
	b.person.Name := name
	return b
}

func (b *PersonBuilder) SetAge(age int) *PersonBuilder {
	b.person.Age := age
	return b
}

func (b *PersonBuilder) Build() *Person {
	return b.person
}

// 使用例
person := NewPersonBuilder().
	SetName("John").
	SetAge("25").
	Build()
```

### 使い分けの基準
1. Factory Patternを使う場合
   - オブジェクト生成が比較的シンプル
   - 必須パラメータが少ない
   - デフォルト値の設定が主な目的
2. Builder Pattern
   - 多くのオプショナルパラメータがある
   - オブジェクト生成に複数のステップが必要
   - 柔軟な構築プロセスが必要