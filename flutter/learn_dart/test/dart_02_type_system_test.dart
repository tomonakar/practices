import 'package:flutter_test/flutter_test.dart';

/// The final key word is used to declare a variable that can only be set once.
/// The const key word is used to declare a variable that is a compile-time constant.
/// The var keyword is used to declare a variable without specifying its type.

// The dynamic keyword is used to declare a variable that can hold any type of value.
void dynamicKeyword() {
  dynamic x = 10;
  x = 'Hello';
  print(x);
}

void main() {
  test('dynamic keyword', () {
    dynamicKeyword();
  });
}
