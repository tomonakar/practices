// ignore_for_file: avoid_print, unused_local_variable

void main() {
  final bankAccount = BankAccount(accountHolder: 'accountHolder', balance: 100);
  bankAccount.deposit(100);
  bankAccount.withdraw(50);

  /// getterを使ってアクセスしている
  print(bankAccount.balance);

  final person = Person(name: 'John', age: 30, height: 1.8);
  person.printDescription();
}

/// コンストラクタの種類の参考
/// https://www.yamarkz.com/blog/research-into-constructor-and-factory-in-dart
///
class BankAccount {
  /// Redirect Constructor。　コンストラクタの処理先を ：以降の親の処理に移譲することができる
  // BankAccount({required String accountHolder, double balance = 0})
  //     : accountHolder = accountHolder,
  //       balance = balance;

  /// Named parameterを利用したコンストラクタ. コンストラクタの引数が多い場合や、コンストラクタの引数の型が重複する場合には積極的に利用するとよい
  BankAccount({required this.accountHolder, required double balance})
      : _balance = balance;
  final String accountHolder;

  /// _ で始まるフィールドはprivateになる
  double _balance;
  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (!canWithdraw(amount)) {
      throw 'Insufficient balance';
    }
    _balance -= amount;
  }

  bool canWithdraw(double amount) {
    return _balance >= amount;
  }
}

class Person {
  Person({required this.name, required this.age, required this.height});
  final String name;
  final int age;
  final double height;

  void printDescription() {
    print('Name: $name, Age: $age, Height: $height');
  }
}

class Complex {
  /// const constructor は インスタンスのフィールドが全てimmutableであることを宣言する場合に使用する
  const Complex(this.re, this.im);

  /// Named constructor は Constructor自体に意味を与え、宣言時にフォールドの値が決定する場合に使用する
  Complex.zero()
      : re = 0,
        im = 0;
  Complex.identity()
      : re = 1,
        im = 0;
  const Complex.real(this.re) : im = 0;

  final double re;
  final double im;
}

void useComplexW() {
  /// const constructorを使ってインスタンス生成しているため、constキーワードで変数を宣言することができる
  const c = Complex(1.0, 2.0);

  /// Named constructorを使って宣言
  final zero = Complex.zero();
  final identity = Complex.identity();
  const real = Complex.real(1.0);
}

/// 温度クラスを作成して、摂氏と華氏をNamed constructorで生成する例
class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.fahrenheit(double celsius) : celsius = (celsius - 32) / 1.8;

  /// stored property
  double celsius;

  /// computed property
  /// getter を使って値を取得する : used get keyword
  double get fahrenheit => celsius * 1.8 + 32;

  /// setter を使って celsius プロパティに値を代入する : used set keyword
  set fahrenheit(double fahrenheit) => celsius = (fahrenheit - 32) / 1.8;
}

void useTemperature() {
  final temp1 = Temperature.celsius(30);
  final temp2 = Temperature.fahrenheit(86);
  print(temp1.celsius);
  temp1.celsius = 35;

  /// getterを使って値を取得する
  print(temp1.fahrenheit);

  /// setterを使って値を代入する
  temp1.fahrenheit = 95;
}
