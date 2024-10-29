import 'dart:developer';
import 'package:flutter_test/flutter_test.dart';

void stringEscaping() {
  log('I\'am');
  log(r'C:\windows\system32');
}

void multilineString() {
  String s = '''
  This is a multiline string.
  It can be used to write a long text.
  ''';
  log(s);
}

String upperCase(String s) {
  return s.toUpperCase();
}

String lowerCase(String s) {
  return s.toLowerCase();
}

void stringInterpolation() {
  String name = 'John';
  int age = 25;
  log('My name is $name and I am $age years old.');
}

// String concatenation is done using the + operator.
void stringConcatenation() {
  String s1 = 'Hello';
  String s2 = 'World';
  log(s1 + ' ' + s2);
}

void stringLength() {
  String s = 'Hello World';
  log(s.length.toString());
}

// The contains() method is used to check if a string contains a substring.
void stringContains() {
  String s = 'Hello World';
  log(s.contains('World').toString());
}

void stringReplace() {
  String s = 'Hello World';
  log(s.replaceAll('World', 'Dart'));
}

void typesConversion() {
  String s = '123';
  // Convert string to integer and double.
  int i = int.parse(s);
  double d = double.parse(s);
  log(i.toString());
  log(d.toString());

// Convert double to string and decimal-point representation.
  double h = 1.85;
  log(h.toStringAsFixed(1));

  // 四捨五入
  log(h.round().toString());
  // 少数部分を切り捨て
  log(h.floor().toString()); // -> -2
  log(1.222.floor().toString()); // -> 1
  // 少数部分を切り上げ
  log(h.ceil().toString());
  // 整数部分の取得
  log(h.truncate().toString());
}

String temperatureConverter(double celsius) {
  // Celsius to Fahrenheit: (°C × 9/5) + 32 = °F
  double fahrenheit = celsius * 9 / 5 + 32;
  return '$celsius°C is $fahrenheit°F';
}

/// Hexadecimal format
void hexFormat() {
  int x = 0xF0; // binary: 11110000
  int y = 0x0F; // binary: 00001111

  // |: OR, &: AND, ^: XOR, ~: NOT
  log((x | y).toString()); // 255
  log((x | y).toRadixString(16)); // hex: ff
  log((x | y).toRadixString(2)); // binary: 111111
  log((x & y).toRadixString(2)); //  0
  log((x ^ y).toRadixString(2)); // 11111111
  log((~y).toRadixString(2)); // -10000
  log((y).toRadixString(2)); // 1111

  int z = 4; // binary: 100

  // <<: left shift, >>: right shift
  log((z << 2).toRadixString(2)); // 10000
  log((z >> 2).toRadixString(2)); // 1
}

/// Statement vs Expression
///
/// A statement is a piece of code that performs an action.
/// statements do not hold a value.
/// statement japanese translation: 文
///
/// An expression is a piece of code that returns a value.
/// expressions hold a value at runtime.
/// expression japanese translation: 式

void main() {
  test('run dart basics', () {
    stringEscaping();
    multilineString();
    log(upperCase('hello'));
    log(lowerCase('WORLD'));
    stringInterpolation();
    stringConcatenation();
    stringLength();
    stringContains();
    stringReplace();
    typesConversion();
    log(temperatureConverter(25));
    hexFormat();
  });
}
