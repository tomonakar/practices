class Document {
  final String name;
  final DateTime createdAt;

  Document({
    required this.name,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

/// プリンター機能のための基本インターフェース
abstract interface class Printer {
  Future<void> print(Document document);
}

/// スキャナー機能のための基本インターフェース
abstract interface class Scanner {
  Future<Document> scan();
}

/// 複合機能のための基本インターフェース
abstract interface class MultiFunctionDevice implements Printer, Scanner {}

/// フォトコピー機の実装
class Photocopier implements MultiFunctionDevice {
  @override
  Future<void> print(Document document) async {
    try {
      // 印刷処理
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw PrinterException('印刷中にエラーが発生しました: $e');
    }
  }

  @override
  Future<Document> scan() async {
    try {
      // スキャン処理
      await Future.delayed(const Duration(seconds: 1));
      return Document(name: 'スキャン文書');
    } catch (e) {
      throw ScannerException('スキャン中にエラーが発生しました: $e');
    }
  }
}

/// デコレーターパターンを使用した実装
class MultiFunctionMachine implements MultiFunctionDevice {
  final Printer _printer;
  final Scanner _scanner;

  const MultiFunctionMachine({
    required Printer printer,
    required Scanner scanner,
  })  : _printer = printer,
        _scanner = scanner;

  @override
  Future<void> print(Document document) => _printer.print(document);

  @override
  Future<Document> scan() => _scanner.scan();
}

/// プリンター関連の例外
class PrinterException implements Exception {
  final String message;
  const PrinterException(this.message);
}

/// スキャナー関連の例外
class ScannerException implements Exception {
  final String message;
  const ScannerException(this.message);
}

Future<void> main() async {
  try {
    // 機器のインスタンス化
    final photocopier = Photocopier();
    final multiFunctionMachine = MultiFunctionMachine(
      printer: photocopier,
      scanner: photocopier,
    );

    // ドキュメントの作成
    final document = Document(name: 'テスト文書');

    print('=== フォトコピー機でのテスト ===');
    await photocopier.print(document);
    print('印刷完了');

    final scannedDoc = await photocopier.scan();
    print('スキャン完了: ${scannedDoc.name}');

    print('\n=== 複合機でのテスト ===');
    await multiFunctionMachine.print(document);
    print('印刷完了');

    final scannedByMFP = await multiFunctionMachine.scan();
    print('スキャン完了: ${scannedByMFP.name}');
  } on PrinterException catch (e) {
    print('プリンターエラー: ${e.message}');
  } on ScannerException catch (e) {
    print('スキャナーエラー: ${e.message}');
  } catch (e) {
    print('予期せぬエラー: $e');
  }
}
