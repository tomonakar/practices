///------------------------------------------------------------------------------
/// 13. Mixins and Extensions
/// Mixins are a way to reuse a class’s code in multiple class hierarchies.
/// - Dart classes can extend only one class.
/// - Mixins solve this problem. add functionality and reuse code in your classes.
///----------------------------------------------------------------------------------

// ignore_for_file: avoid_print

mixin Swimmer {
  void swim() {
    print('Swimming');
  }
}

mixin Walker {
  void walk() {
    print('Walking');
  }
}

class Animal {
  void eat() {
    print('Animal is eating');
  }
}

class Person extends Animal with Walker, Swimmer {
  void test() {
    eat();
  }
}

/// ------------------------------------------------------------------------------
/// Extension は 既存のライブラリに機能を追加するためのものです。
/// Extension は、名前を持つことができ、APIの名前空間が衝突するのを防ぐことができます。
/// on keyword は、拡張する型を指定します。
/// ------------------------------------------------------------------------------

/// これは、Iterable<T> に sum() メソッドを追加する拡張です。
/// num は、intとdoubleを持つ数値型の基底クラスです。
extension IterableX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
}

void main() {
  var person = Person();
  person.eat();
  person.swim();
  person.walk();
  person.test();

  /// mixinはインスタンス化できないのでこれはエラーになる
  // var swimmer = Swimmer();

  int sum1 = [1, 2, 3, 4, 5].sum();
  double sum2 = [1.0, 2.0, 3.0, 4.0, 5.0].sum();
  print(sum1);
  print(sum2);
}
