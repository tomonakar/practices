// ignore_for_file: avoid_print

import 'dart:math';

import 'package:equatable/equatable.dart';

void main() {
  final animal = Animal(age: 10);
  animal.sleep();
  final dog = Dog(age: 10);
  dog.bark();
  dog.sleep();
  final cleverDog = CleverDog(age: 10);
  cleverDog.catchBall();

  /// abstract class
  final Shape square = Square(10);
  printArea(square);

  final Shape circle = Circle(10);
  printArea(circle);

  /// toString() method
  print(const Point(10, 20));
  const list = [Point(1, 2), Point(3, 4), Point(5, 6)];
  print(list);

  // the equality operator == and the covariant keyword
  print(const Point(1, 2) == const Point(1, 2)); // true
  print(const Point(2, 10) + const Point(1, 2)); // Point(3, 12)
  print(const Point(10, 20) * 2); // Point(20, 40)

  // overriding hashCode and the Equatable package
  print(const Point2(10, 20) == const Point2(10, 20)); // true
  print(const Point2(1, 20) == const Point2(10, 20)); // true
  print(const Point2(10, 1));
}

/// Subclass is extend the functionality of an existing class.
/// And increase code reusability.
/// Existing class is called superclass.
/// subclass is called derived class.

/// Animal is a superclass.
class Animal {
  Animal({required this.age});
  final int age;

  void sleep() => print('sleep');
}

class Dog extends Animal {
  /// The super keyword is used to refer to the superclass.
  Dog({required super.age});

  void bark() => print('bark');

  /// The @override annotation is used to indicate that a method is overriding a method from a superclass.
  @override
  void sleep() => print('dog sleep');
}

class Cow extends Animal {
  /// The super keyword is used to refer to the superclass.
  Cow({required super.age});

  void moo() => print('moo');

  @override
  sleep() {
    super.sleep();
    print('cow sleep');
  }
}

class CleverDog extends Dog {
  /// The super keyword is used to refer to the superclass.
  CleverDog({required super.age});

  void catchBall() => print('catch ball');
}

/// Abstract classes are classes that cannot be instantiated.
abstract class Shape {
  double get area;
  const Shape();

  /// -----------------------------------------------------------------
  /// Factory Constructor
  /// 1. オブジェクトとのキャッシング
  /// 2. シングルトンパターンの実装
  /// 3. 条件に基づくサブクラスのインスタンス化
  /// 4. 複雑なオブジェクトの生成ロジックの実装
  /// 5. データ変換やパース処理
  /// ------------------------------------------------------------------
  factory Shape.fromJson(Map<String, dynamic> json) {
    final type = json['type'];

    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        }
        throw UnsupportedError('invalid or missing side property');
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius);
        }
        throw UnsupportedError('unsupported shape type');
      default:
        throw UnsupportedError('shape $type is not recognized');
    }
  }

  /// dart3のパターンマッチングを使ったfactory constructor
  factory Shape.fromJsonWithPatternMatching(Map<String, dynamic> json) {
    return switch (json) {
      {
        'type': 'square',
        'side': double side,
      } =>
        Square(side),
      {
        'type': 'circle',
        'radius': double radius,
      } =>
        Circle(radius),
      {'type': String type} =>
        throw UnsupportedError('shape $type is not recognized'),
      _ => throw UnsupportedError('invalid shape data'),
    };
  }
}

class Square extends Shape {
  const Square(this.side);
  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  const Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

/// -----------------------------------------------------------------
///  Interfaces and the difference between abstract class and extends
/// ------------------------------------------------------------------
abstract class InterfaceA {
  void methodA();
}

abstract class InterfaceB {
  void methodB();
}

/// implementsの特徴
/// - 複数のinterfaceを実装できる (extendsは一つのみ)
/// - abstract methodは全て実装しなければならない
/// - concrete methodは全て実装しなければならない　（abstract classは任意） * concrete methodとは、具体クラスで実装されるメソッドのこと
class ClassA implements InterfaceA, InterfaceB {
  @override
  void methodA() {
    print('methodA');
  }

  @override
  void methodB() {
    print('methodB');
  }
}

abstract class Base {
  void foo();
  void bar() => print('bar');
}

class Subclass extends Base {
  @override
  void foo() {
    print('foo');
  }
}

class Point {
  const Point(this.x, this.y);
  final double x;
  final double y;

  @override
  String toString() => 'Point($x, $y)';

  /// Use covariant to change the type of an argument when overriding a method.
  @override
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int other) {
    return Point(x * other, y * other);
  }
}

class Point2 extends Equatable {
  const Point2(this.x, this.y);
  final double x;
  final double y;

  @override
  List<Object> get props => [x, y];

  @override
  bool get stringify => true;
}

/// -----------------------------------------------------------------
/// generics
/// Composition vs inheritance
/// Composition is has-a relationship.
/// Inheritance is is-a relationship.
/// ------------------------------------------------------------------
class Stack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);
  T pop() => _items.removeLast();
}

/// -----------------------------------------------------------------
/// Copping objects with the copyWith method for immutable classes
/// ------------------------------------------------------------------
class Credentials {
  Credentials({required this.username, required this.password});
  final String username;
  final String password;

  Credentials copyWith({String? username, String? password}) {
    return Credentials(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'Credentials($username, $password)';
}

/// -----------------------------------------------------------------
/// The cascade operator (..)
/// ------------------------------------------------------------------
class ClosedPath {
  final List<Point> _points = [];

  ClosedPath moveTo(Point point) {
    _points.add(point);
    return this;
  }

  ClosedPath lineTo(Point point) {
    _points.add(point);
    return this;
  }

  @override
  String toString() => 'ClosedPath($_points)';
}

void cascadeOperatorExample() {
  final path = ClosedPath()
    ..moveTo(const Point(0, 0))
    ..lineTo(const Point(10, 20))
    ..lineTo(const Point(20, 30));
  print(path);

  const unUseCascadeOperator = true;
  if (unUseCascadeOperator) {
    final path = ClosedPath();
    path.moveTo(const Point(0, 0));
    path.lineTo(const Point(10, 20));
    path.lineTo(const Point(20, 30));
    print(path);
  }
}
