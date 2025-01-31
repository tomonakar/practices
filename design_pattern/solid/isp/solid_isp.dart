class Document {}

// プリンターインターフェース
abstract class Printer {
  void print(Document d);
}

// スキャナーインターフェース
abstract class Scanner {
  void scan(Document d);
}

// 複合機能インターフェース
abstract class MultiFunctionDevice implements Printer, Scanner {}

// フォトコピー機の実装
class Photocopier implements Printer, Scanner {
  @override
  void scan(Document d) {
    // スキャン処理
  }

  @override
  void print(Document d) {
    // 印刷処理
  }
}

// デコレーターパターンを使用した実装
class MultiFunctionMachine implements MultiFunctionDevice {
  final Printer printer;
  final Scanner scanner;

  MultiFunctionMachine(this.printer, this.scanner);

  @override
  void print(Document d) {
    printer.print(d); // プリンター機能を移譲
  }

  @override
  void scan(Document d) {
    scanner.scan(d); // スキャナー機能を移譲
  }
}

void main() {
  // 使用例
  final photocopier = Photocopier();
  final multiFunctionMachine = MultiFunctionMachine(photocopier, photocopier);
}
