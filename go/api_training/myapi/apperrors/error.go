package apperrors

type MyAppError struct {
	// ErrCode型のErrCodeフィールド
	// (フィールド名を省略すると型名がフィールド名になる)
	ErrCode // レスポンスとログに出力するエラーコード

	// string型のMessageフィールド
	Message string // レスポンスに表示するエラーメッセージ
	Err     error  `json:"-"` // エラーチェーンのための内部エラー, jsonには出力しない
}

// Error - Error()メソッドを実装することで、MyAppError型はerrorインターフェースを満たす
func (e *MyAppError) Error() string {
	return e.Err.Error()
}

// Unwrap - Unwrap()メソッドを実装することで、MyAppError型はerrors.Unwrap()を満たす
func (e *MyAppError) Unwrap() error {
	return e.Err
}
