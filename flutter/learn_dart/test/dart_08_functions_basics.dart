/// named and positional arguments
/// default values and required parameters
/// arrow notation
/// lexical scope & inner functions
/// avoid global mutable state and pure functions

void main() {
  print(positionalArguments('Hello', 'World'));
  print(namedArguments(b: 'World', a: 'Hello'));
  print(requiredAndDefaultArguments(a: 'Hello'));
  print(defaultPositionalArguments(10));
}

String positionalArguments(String a, String b) {
  return '$a $b';
}

String namedArguments({String? a, String? b}) {
  return '$a $b';
}

String requiredAndDefaultArguments({required String a, String b = 'World'}) {
  return '$a $b';
}

int defaultPositionalArguments(int a, [int b = 2]) {
  return a + b;
}

int arrowNotation(int a, int b) => a + b;

void printSum(int a, int b) => print(a + b);

/// レキシカルスコープとは、変数が宣言された場所によって変数の有効範囲が決まることです。
/// この例では、innerFunction()関数の中で変数aを参照していますが、
/// innerFunction()関数の外で宣言された変数aを参照しています。
void lexicalScope() {
  var a = 10;

  void innerFunction() {
    var b = 20;
    print(a + b);
  }

  innerFunction();
}
