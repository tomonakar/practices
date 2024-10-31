// ignore: dangling_library_doc_comments
import 'dart:convert';

/// sealedクラス が Result Typeで利用される理由
/// - 成功・失敗の２つの状態を型安全に表現できる
/// - パターンマッチングで漏れを防げる
/// - エラーハンドリングを強制できる
/// @see: https://zenn.dev/masakunn/articles/e9244ba264578e
/// @see: https://codewithandrea.com/articles/flutter-exception-handling-try-catch-result-type/#improved-exception-handling-with-sealed-classes-and-the-result-type

sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

// Result Typeを使った例
Future<Result<Location, Exception>> getLocationFromIP(String ipAddress) async {
  try {
    final uri = Uri.parse('https://hoge.com/$ipAddress');
    final response = await http.get(uri);
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return Success(Location.fromMap(data));
      default:
        return Failure(Exception(response.reasonPhrase));
    }
  } on Exception catch (e) {
    return Failure(e);
  }
}

// getLocationFromIPの呼び出し
void main() async {
  final result = await getLocationFromIP('192.168.10.1');
  final value = switch (result) {
    Success(value: final location) => location.toString(),
    Failure(exception: final e) => 'something went wrong: $e',
  };
  print(value);
}

var http;

class Location {
  static Location fromMap(data) {
    return Location();
  }
}
