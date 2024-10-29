void main() {
  print(sayHi('John'));
  welcome(sayHi, 'John');
  welcom2(sayHi, 'Taro');
  forEachExample();
  mapExample();
}

/// Anonymous function
final sayHi = (String name) => 'Hi $name';

/// Function as first class objects
void welcome(String Function(String) great, String name) {
  print(great(name));
  print('Hi, $name');
  print('Welcome to the Dart world');
}

/// Function types
typedef Great = String Function(String);
void welcom2(Great great, String name) {
  print(great(name));
  print('Hi, $name');
  print('Welcome to the Dart world');
}

void forEachExample() {
  final list = [1, 2, 3, 4, 5];
  // list.forEach((element) => print(element));
  list.forEach(print);
}

void mapExample() {
  final list = [1, 2, 3, 4, 5];
  final doubled = list.map((e) => e * 2);
  print(doubled);
}

void iterableAndToList() {
  final list = [1, 2, 3, 4, 5];

  /// map() returns an Iterable<int> object and toList method converts it to a List<int> object that lazy evaluation is not performed.
  /// Caution: toList() method use a lot of memory. So, you should not use it for a large data set.
  final List<int> doubled = list.map((e) => e * 2).toList();
  print(doubled);
}
