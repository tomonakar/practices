// ignore_for_file: avoid_print

void main() {
  print(sayHi('John'));
  welcome(sayHi, 'John');
  welcome2(sayHi, 'Taro');
  forEachExample();
  mapExample();

  const list = [1, 2, 3];
  const list2 = [1.0, 2.0, 3.0];
  final doubles = transform<int, int>(list, (x) => x * 2);
  print(doubles);

  final squares = transform<double, int>(list2, (x) => x.round());
  print(squares);

  whereExample();
  final odd = where<int>(list, (e) => e.isOdd);
  print(odd);

  reduceExample();
  combiningFunctionalOperators();
}

/// Anonymous function
// ignore: prefer_function_declarations_over_variables
final sayHi = (String name) => 'Hi $name';

/// Function as first class objects
void welcome(String Function(String) great, String name) {
  print(great(name));
  print('Hi, $name');
  print('Welcome to the Dart world');
}

/// Function types
typedef Great = String Function(String);
void welcome2(Great great, String name) {
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
  final doubles = list.map((e) => e * 2);
  print(doubles);
}

void iterableAndToList() {
  final list = [1, 2, 3, 4, 5];

  /// map() returns an Iterable<int> object and toList method converts it to a List<int> object that lazy evaluation is not performed.
  /// Caution: toList() method use a lot of memory. So, you should not use it for a large data set.
  final List<int> doubled = list.map((e) => e * 2).toList();
  print(doubled);
}

List<R> transform<T, R>(List<T> items, R Function(T) f) {
  final result = <R>[];
  for (var x in items) {
    // very powerful: delegate the transformation to the function f. delegate: 移譲する
    result.add(f(x));
  }
  return result;
}

void whereExample() {
  final list = [1, 2, 3, 4, 5];
  // whereは、条件に合致する要素を抽出する。filterと同じ.
  final evenNumbers = list.where((e) => e.isEven);
  print(evenNumbers);

  /// firstWhereは、条件に合致する最初の要素を返す。条件に合致する要素がない場合は、例外をスローする。findと同じ
  /// orElseは、条件に合致する要素がない場合に返す値を指定する。
  final value = list.firstWhere((e) => e == 3, orElse: () => -1);
  print(value);
}

List<T> where<T>(List<T> items, bool Function(T) f) {
  final result = <T>[];
  for (var item in items) {
    if (f(item)) {
      result.add(item);
    }
  }
  return result;
}

///  Dartのreduceは、リストの要素を1つにまとめる。
/// typescriptとの違いは、Dartのreduceは、初期値がリストの最初の要素になることだ。
void reduceExample() {
  final list = [1, 2, 3, 4, 5];
  final sum = list.reduce((value, element) => value + element);
  print(sum);
  // value:   1 3 6 10 15
  // element: 2 3 4 5
}

/// foldは、reduceと同じようにリストの要素を1つにまとめるが、初期値を指定できる。
/// 例えば、リストの要素をすべて加算する場合、初期値は0になる。
/// dart の fold が typescript の reduce に相当する.
void foldExample() {
  final list = [1, 2, 3, 4, 5];
  final sum = list.fold(0, (value, element) => value + element);
  print(sum);
  // value:   0 1 3 6 10 15
  // element: 1 2 3 4 5
}

void combiningFunctionalOperators() {
  final list = [1, 2, 3, 4, 5];
  final sum =
      list.where((e) => e.isEven).reduce((value, element) => value + element);
  print(sum); // 6

  const emails = [
    'abc@abc.com',
    'me@example.co.uk',
    'jhon@gmail.com',
    'katy@yahoo.com',
  ];

  const knownDomains = ['gmail.com', 'yahoo.com'];
  final unknownDomains = emails
      .map((email) => email.split('@').last)
      .where((domain) => !knownDomains.contains(domain));
  print(unknownDomains);
}
