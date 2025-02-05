# Faceted Builder Pattern

Builderパターンの応用で、複数の側面(facets)を持つオブジェクトを構築するためのデザインパターン.

## 概要

複雑なオブジェクトを構築する際に、関連する属性をグループ化し、それぞれのグループに特化したビルダーを提供する.

## メリット

1. **関心の分離**
   - 異なる属性グループを別々のビルダーで管理
   - コードの保守性と可読性が向上
   - 責務の明確な分離

2. **流暢なインターフェース**
   - メソッドチェーンによる直感的なAPI
   - コードの可読性が向上
   - タイプミスや順序の誤りを防止

3. **段階的な構築**
   - オブジェクトの各側面を独立して設定可能
   - 必要な属性のみを設定
   - 柔軟な構築プロセス

## 実装方法

```go
// 1. メインの構造体を定義
type Person struct {
    // 住所関連
    StreetAddress, Postcode, City string
    // 仕事関連
    CompanyName, Position string
    AnnualIncome int
}

// 2. ベースビルダーを定義
type PersonBuilder struct {
    person *Person
}

func NewPersonBuilder() *PersonBuilder {
    return &PersonBuilder{&Person{}}
}

// ３． 各側面のビルダーを作成
// 住所用ビルダー
type PersonAddressBuilder struct {
    PersonBuilder
}

// 仕事用ビルダー
type PersonJobBuilder struct {
    PersonBuilder
}

// 4. facetアクセサを追加
func (it *PersonBuilder) Lives() *PersonAddressBuilder {
    return &PersonAddressBuilder{*it}
}

func (it *PersonBuilder) Works() *PersonJobBuilder {
    return &PersonJobBuilder{*it}
}

// 5. 各ビルダーにメソッドを追加
func (pab *PersonAddressBuilder) At(streetAddress string) *PersonAddressBuilder {
    pab.person.StreetAddress = streetAddress
    return pab
}

func (pjb *PersonJobBuilder) AsA(position string) *PersonJobBuilder {
    pjb.person.Position = position
    return pjb
}

// 使用例
func main() {
    pb := NewPersonBuilder()
    person := pb.
        Lives().
            At("123 London Road").
            In("London").
            WithPostcode("SW12BC").
        Works().
            At("Fabrikam").
            AsA("Programmer").
            Earning(123000).
        Build()
}
```

## ユースケース
1. 複数のカテゴリの属性を持つエンティティの構築
   - ユーザープロファイル（個人情報、設定、権限など）
   - 注文情報（配送先、支払い、商品など）
2. 段階的な設定が必要なオブジェクト
   - 設定ファイル
   - アプリケーション構成
   - データベース接続
3. オプショナルな属性が多いオブジェクト
   - APIリクエスト
   - レポート生成
   - ドキュメント作成

## 注意点
1. 複雑さの管理
  - 必要以上にファセットを増やさない
  - 関連する属性を適切にグループ化
2. 貫性の維持
  - 各ビルダー間で矛盾した状態を作らない
  - バリデーションを適切に実装
3. メモリ管理
  - ポインタの取り扱いに注意
  - 適切なメモリ解放