enum Color {
  Red,
  Green,
  Blue,
}

enum Size {
  Small,
  Medium,
  Large,
}

class Product {
  constructor(public name: string, public color: Color, public size: Size) {}
}

interface Specification {
  isSatisfied(item: Product): boolean
}

class ColorSpecification implements Specification {
  constructor(private color: Color) {}

  isSatisfied(item: Product): boolean {
    return item.color === this.color
  }
}

class SizeSpecification implements Specification {
  constructor(private size: Size) {}

  isSatisfied(item: Product): boolean {
    return item.size === this.size
  }
}

class AndSpecification implements Specification {
  constructor(private first: Specification, private second: Specification) {}

  isSatisfied(item: Product): boolean {
    return this.first.isSatisfied(item) && this.second.isSatisfied(item)
  }
}

class BetterFilter {
  filter(items: Product[], spec: Specification): Product[] {
    return items.filter((item) => spec.isSatisfied(item))
  }
}

const apple = new Product("Apple", Color.Green, Size.Small)
const tree = new Product("Tree", Color.Green, Size.Large)
const house = new Product("House", Color.Blue, Size.Large)

const products = [apple, tree, house]

console.log("Green products (new):")
const greenSpec = new ColorSpecification(Color.Green)
const bf = new BetterFilter()
bf.filter(products, greenSpec).forEach((p) =>
  console.log(` - ${p.name} is green`),
)
