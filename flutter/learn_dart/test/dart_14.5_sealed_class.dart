// ignore: dangling_library_doc_comments
/// @see: https://codewithandrea.com/articles/flutter-exception-handling-try-catch-result-type/#improved-exception-handling-with-sealed-classes-and-the-result-type

/// sealed class
/// - 同じファイル内でのも継承可能
/// - 全てのサブクラスを把握できる
/// - パターンマッチングで漏れを防げる
///
/// sealedクラスのメリット
/// - 型安全性の向上 - コンパイル時に全てのケースを網羅しているかチェックできる
/// - コードの保守性向上 - 新しいサブクラスを追加した際に、switch文などで処理漏れがあるとコンパイラが警告してくれる
/// - 意図しない継承の防止 - 外部からの予期せぬ継承を防ぐことができる
///
/// 一般的な利用シーン
/// - 状態管理（UIの状態管理、APIのレスポンス管理）
/// - エラーハンドリング
/// - データモデル定義
///

// UIの状態管理の例
sealed class LoadingState {}

class Initial extends LoadingState {}

class Loading extends LoadingState {}

class Success extends LoadingState {
  final dynamic data;
  Success(this.data);
}

class Error extends LoadingState {
  final String message;
  Error(this.message);
}

// stateが網羅されていないと警告が出る
void handleState(LoadingState state) => switch (state) {
      Initial() => print('Initial'),
      Loading() => print('Loading'),
      Success(data: final data) => print('Success: $data'),
      Error(message: final message) => print('Error: $message')
    };
