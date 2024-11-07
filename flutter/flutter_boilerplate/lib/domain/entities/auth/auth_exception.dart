import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.invalidEmail() = InvalidEmail;
  const factory AuthException.wrongPassword() = WrongPassword;
  const factory AuthException.userNotFound() = UserNotFound;
  const factory AuthException.userDisabled() = UserDisabled;
  const factory AuthException.tooManyRequests() = TooManyRequests;
  const factory AuthException.operationNotAllowed() = OperationNotAllowed;
  const factory AuthException.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthException.weakPassword() = WeakPassword;
  const factory AuthException.tokenExpired() = TokenExpired;
  const factory AuthException.invalidToken() = InvalidToken;
  const factory AuthException.unknown() = UnknownAuthError;

  const AuthException._();

  String get message => when(
        invalidEmail: () => 'メールアドレスの形式が正しくありません。',
        wrongPassword: () => 'パスワードが間違っています。',
        userNotFound: () => 'ユーザーが見つかりません。',
        userDisabled: () => 'このアカウントは無効化されています。',
        tooManyRequests: () => 'リクエストが多すぎます。しばらく待ってから再試行してください。',
        operationNotAllowed: () => 'この操作は許可されていません。',
        emailAlreadyInUse: () => 'このメールアドレスは既に使用されています。',
        weakPassword: () => 'パスワードが脆弱です。より強力なパスワードを設定してください。',
        tokenExpired: () => '認証の有効期限が切れています。再度ログインしてください。',
        invalidToken: () => '無効な認証トークンです。',
        unknown: () => '認証エラーが発生しました。',
      );
}
