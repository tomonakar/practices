# Builder Parameter

## 主な特徴
- パラメーターの設定をビルダーとして扱う


## 従来のアプローチ

```go
// 従来のアプローチ
email := NewEmail("from@example.com", "to@example.com", "subject", "body")
```

- パラメータの順序に依存
- 引数の意味がわかりにくい
- オプショナルなパラメータの扱いが難しい

## Builder Parameter

```go
// Builder Parameterパターン
email := NewEmailBuilder().
    From("from@example.com").
    To("to@example.com").
    Subject("subject").
    Body("body").
    Build()
```

- 各パラメータの意味が明確
- パラメータの設定順序が自由
- メソッド名で各パラメータの役割を表現

## メリット
1. オブジェクト生成の複雑さを隠蔽
2. パラメータの設定を分かりやすく記述可能
3. バリデーションロジックをビルダー内にカプセル化
4. 必須パラメータと任意パラメータの区別が容易

## 作り方
1. 基本構造体の定義
1. ビルダー構造体の定義
1. ビルダーメソッドの実装
1. Build()メソッドの実装
1. 利用

```go
// 1. 基本構造体の定義
type Person struct {
    name string
    age  int
    city string
}

// 2. ビルダー構造体の定義
type PersonBuilder struct {
    person Person
}

// 新しいビルダーを作成する関数
func NewPersonBuilder() *PersonBuilder {
    return &PersonBuilder{}
}

// 3. ビルダーメソッドの実装
func (b *PersonBuilder) Name(name string) *PersonBuilder {
    b.person.name = name
    return b
}

func (b *PersonBuilder) Age(age int) *PersonBuilder {
    b.person.age = age
    return b
}

func (b *PersonBuilder) City(city string) *PersonBuilder {
    b.person.city = city
    return b
}

// 4. Build()メソッドの実装
func (b *PersonBuilder) Build() Person {
    return b.person
}

// 5. 使用例
func main() {
    person := NewPersonBuilder().
        Name("田中太郎").
        Age(30).
        City("東京").
        Build()
    
    fmt.Printf("名前: %s, 年齢: %d, 都市: %s\n", 
        person.name, 
        person.age, 
        person.city)
}
```

### point
- 各メソッドは*PersonBuilderを返すことでメソッドチェーンを可能に
- Build()を最後に呼び出して完成したオブジェクトを取得
- バリデーションが必要な場合は各メソッド内で実装可能