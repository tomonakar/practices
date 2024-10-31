// ignore_for_file: dangling_library_doc_comments, avoid_print

import 'dart:developer';

///---------------------------------------------------------
/// Errors vs Exceptions
///
/// Error:
/// - Programmer mistake.
/// - Calling a function with invalid arguments, index out of range, etc.
/// - If an error occurs, it is better to fix the code, so it should not be caught and the program should be terminated.
///
/// Exception:
/// - Failure condition: something unexpected happened.
/// - Unexpected out of control conditions like network failure, hardware failure, etc.
/// - Exceptions can be caught and handled.
///
/// @see: https://zenn.dev/1mash0/articles/6e2199abebe1ff
///---------------------------------------------------------

/// assert is useful for debugging
class PositiveInt {
  const PositiveInt(this.value)
      : assert(value >= 0, 'Value must be greater than or equal to 0');

  final int value;
}

void signIn(String email, String password) {
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

// Exceptions
class Fraction {
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw UnsupportedError('Denominator cannot be 0');
    }
  }

  final int numerator;
  final int denominator;

  double get value => numerator / denominator;
}

void testFraction() {
  try {
    final fraction = Fraction(3, 1);
    print(fraction.value);

    /// try catch は on句 を使って特定の例外をキャッチするべき
    /// そうしなければ、全ての例外をキャッチしてしまい、単なるプログラマーのミスであるerrorもキャッチしてしまう
    /// 捕捉したいのは、例外のみであり、エラーはそのままプログラムを停止させて、修正すべきである
    /// ここでのUnsupportedError　は、利用者が0で割ることを防ぐためのものであり、プログラムのエラーではなく例外として扱うので捕捉している
  } on UnsupportedError catch (e) {
    print(e);

    /// 例外を再スローする場合は、rethrow を使う. throw を使うと、スタックトレースが最後にスローされた場所になる
    rethrow;

    /// その他例外
  } on Exception catch (e) {
    print(e);
    // TODO: handle exception
  } finally {
    print('testFraction() completed');
  }
}

void testFunction2() {
  try {
    testFraction();

    /// もし、on区を使わずに全ての例外をキャッチする場合は、　ログの記録、ユーザーへの通知、必要に応じて再スローするなどの処理を行う
  } catch (e) {
    log('An error occurred: $e');
    rethrow;
  }
}

void main() {
  // Error
  // const list = [1, 2, 3];
  // print(list[4]);
  // signIn("", "");

  final invalidAge = PositiveInt(-1);
  print(invalidAge);

  testFraction();
}
