package middlewares

import (
	"log"
	"net/http"
)

// 自作ResponseWriterを定義
type resLoggingWriter struct {
	// 移譲先のResponseWriter
	http.ResponseWriter
	code int
}

// コンストラクタ
func NewResLoggingWriter(w http.ResponseWriter) *resLoggingWriter {
	return &resLoggingWriter{w, http.StatusOK}
}

// 　WriteHeaderをオーバーライド
// 移譲先のWriteHeaderを呼び出す前に、ステータスコードを保持する
func (rlw *resLoggingWriter) WriteHeader(code int) {
	rlw.code = code
	// 移譲先のWriteHeaderを呼び出す
	// これにより、実際にレスポンスが返される
	rlw.ResponseWriter.WriteHeader(code)
}

func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
		// リクエスト情報をロギング
		log.Println(req.RequestURI, req.Method)

		rlw := NewResLoggingWriter(w)

		// レスポンスを返す
		next.ServeHTTP(rlw, req)

		// レスポンス情報をロギング
		log.Printf("res: %d\n", rlw.code)

	})
}
