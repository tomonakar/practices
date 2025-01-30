enum Color { red, green, blue }

enum Size { small, medium, large }

class Product {
  final String name;
  final Color color;
  final Size size;

  const Product(this.name, this.color, this.size);
}

abstract class Specification {
  bool isSatisfied(Product product);
}

class ColorSpecification implements Specification {
  final Color color;

  const ColorSpecification(this.color);

  @override
  bool isSatisfied(Product product) => product.color == color;
}

class SizeSpecification implements Specification {
  final Size size;

  const SizeSpecification(this.size);

  @override
  bool isSatisfied(Product product) => product.size == size;
}

class AndSpecification implements Specification {
  final Specification first;
  final Specification second;

  const AndSpecification(this.first, this.second);

  @override
  bool isSatisfied(Product product) =>
      first.isSatisfied(product) && second.isSatisfied(product);
}

class BetterFilter {
  List<Product> filter(List<Product> products, Specification spec) {
    return products.where((p) => spec.isSatisfied(p)).toList();
  }
}

void main() {
  final products = [
    Product('Apple', Color.green, Size.small),
    Product('Tree', Color.green, Size.large),
    Product('House', Color.blue, Size.large),
  ];

  print('Green products (new):');
  final greenSpec = ColorSpecification(Color.green);
  final bf = BetterFilter();
  for (final v in bf.filter(products, greenSpec)) {
    print(' - ${v.name} is green');
  }

  final largeSpec = SizeSpecification(Size.large);
  final largeGreenSpec = AndSpecification(largeSpec, greenSpec);
  print('Large green items:');
  for (final v in bf.filter(products, largeGreenSpec)) {
    print(' - ${v.name} is large and green');
  }
}
