import 'dart:developer';
import 'package:flutter_test/flutter_test.dart';

void ifElseStatement() {
  int x = 10;
  if (x > 5) {
    log('x is greater than 5');
  } else {
    log('x is less than or equal to 5');
  }
}

void whileLoop() {
  int x = 0;
  while (x < 5) {
    log(x.toString());
    x++;
  }
}

void doWhileLoop() {
  int x = 0;
  do {
    log(x.toString());
    x++;
  } while (x < 5);
}

void forLoop() {
  for (int i = 0; i < 5; i++) {
    log(i.toString());
  }
}

void forInLoop() {
  List<int> numbers = [1, 2, 3, 4, 5];
  for (int n in numbers) {
    log(n.toString());
  }
}

void breakStatement() {
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      break;
    }
    log(i.toString());
  }
}

void continueStatement() {
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      continue;
    }
    log(i.toString());
  }
}

void breakAndContinue() {
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      // Exit the loop.
      break;
    }
    log(i.toString());
  }
  log('break statement executed');

  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      // Skip the rest of the loop body.
      continue;
    }
    log(i.toString());
  }
  log('continue statement executed');
}

enum ABC { a, b, c }

/// dart3からswitch文の表現力が向上した
String switchCase(String value) {
  String result;
  switch (value) {
    case 'a':
      result = 'aa';
    case 'b' || 'c':
      result = 'bb';
    default:
      result = 'zz';
  }
  return result;
}

String switchReturn(String value) {
  return switch (value) { 'a' => 'aa', 'b' || 'c' => 'bb', _ => 'zz' };
}

/// enum
enum Medal { gold, silver, bronze }

void enumDart2() {
  const medal = Medal.gold;

  print(medal);
  print(medal.name);
  print(Medal.values.byName('silver'));

  switch (medal) {
    case Medal.gold:
      log('Gold');
      break;
    case Medal.silver:
      log('Silver');
      break;
    case Medal.bronze:
      log('Bronze');
      break;
  }
}

/// simple calculator with enum and switch
enum Operator { plus, minus, multiply, divide }

int calculator(int a, int b, Operator operator) {
  switch (operator) {
    case Operator.plus:
      return a + b;
    case Operator.minus:
      return a - b;
    case Operator.multiply:
      return a * b;
    case Operator.divide:
      return a ~/ b;
  }
}

void main() {
  test('switch case', () {
    expect(switchCase('a'), 'aa');
    expect(switchCase('b'), 'bb');
    expect(switchCase('c'), 'bb');
    expect(switchCase('d'), 'zz');
  });

  test('switch return', () {
    expect(switchReturn('a'), 'aa');
    expect(switchReturn('b'), 'bb');
    expect(switchReturn('c'), 'bb');
    expect(switchReturn('d'), 'zz');
  });

  test('run enumDart2', () {
    enumDart2();
  });

  test('simple calculator', () {
    expect(calculator(10, 5, Operator.plus), 15);
    expect(calculator(10, 5, Operator.minus), 5);
    expect(calculator(10, 5, Operator.multiply), 50);
    expect(calculator(10, 5, Operator.divide), 2);
  });
}
