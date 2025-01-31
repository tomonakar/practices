enum Color {
  red('Red'),
  green('Green'),
  blue('Blue');

  final String label;
  const Color(this.label);
}

enum Size {
  small('Small'),
  medium('Medium'),
  large('Large');

  final String label;
  const Size(this.label);
}

class Product {
  final String name;
  final Color color;
  final Size size;

  const Product({
    required this.name,
    required this.color,
    required this.size,
  });

  @override
  String toString() => '$name (${color.label}, ${size.label})';
}

abstract interface class Specification<T> {
  bool isSatisfied(T item);
}

class ColorSpecification extends Specification<Product> {
  final Color color;
  ColorSpecification(this.color);

  @override
  bool isSatisfied(Product product) => product.color == color;
}

class SizeSpecification extends Specification<Product> {
  final Size size;
  SizeSpecification(this.size);

  @override
  bool isSatisfied(Product product) => product.size == size;
}

// 合成仕様をより柔軟に
class CompositeSpecification extends Specification<Product> {
  final List<Specification<Product>> specifications;
  final bool Function(List<bool>) combiner;

  CompositeSpecification({
    required this.specifications,
    required this.combiner,
  });

  @override
  bool isSatisfied(Product product) {
    return combiner(
      specifications.map((spec) => spec.isSatisfied(product)).toList(),
    );
  }

  static bool and(List<bool> results) => results.every((result) => result);
  static bool or(List<bool> results) => results.any((result) => result);
}

// より機能的なフィルター
class ProductFilter {
  const ProductFilter();

  Iterable<Product> filter(
    Iterable<Product> products,
    Specification<Product> spec,
  ) =>
      products.where(spec.isSatisfied);
}

void main() {
  final products = [
    Product(name: 'Apple', color: Color.green, size: Size.small),
    Product(name: 'Tree', color: Color.green, size: Size.large),
    Product(name: 'House', color: Color.blue, size: Size.large),
  ];

  final filter = ProductFilter();

  // Green productsを検索
  print('\nGreen products:');
  filter
      .filter(products, ColorSpecification(Color.green))
      .forEach((p) => print('- $p'));

  // large and green productsを検索
  print('\nLarge green products:');
  final largeGreenSpec = CompositeSpecification(
    specifications: [
      SizeSpecification(Size.large),
      ColorSpecification(Color.green),
    ],
    combiner: CompositeSpecification.and,
  );

  filter.filter(products, largeGreenSpec).forEach((p) => print('- $p'));

  // large or green productsを検索
  print('\nLarge or green products:');
  final largeOrGreenSpec = CompositeSpecification(
    specifications: [
      SizeSpecification(Size.large),
      ColorSpecification(Color.green),
    ],
    combiner: CompositeSpecification.or,
  );
  filter.filter(products, largeOrGreenSpec).forEach((p) => print('- $p'));
}
