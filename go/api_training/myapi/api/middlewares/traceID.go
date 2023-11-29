package middlewares

import (
	"context"
	"sync"
)

var (
	logNo int = 1
	mu    sync.Mutex
)

// 空の構造体をキーにすることで、無駄な情報を持たないようにし、メモリを節約すると同時にキーの衝突を防ぐ
type traceIDKey struct{}

func newTraceID() int {
	var no int

	mu.Lock()
	no = logNo
	logNo += 1
	mu.Unlock()

	return no
}

func SetTraceID(ctx context.Context, traceID int) context.Context {
	return context.WithValue(ctx, traceIDKey{}, traceID)
}

func GetTraceID(ctx context.Context) int {
	id := ctx.Value(traceIDKey{})

	// contextインターフェースのValueメソッドの戻り値はany型のため、
	// 型アサーションを使ってint型に変換する
	if idInt, ok := id.(int); ok {
		return idInt
	}
	return 0
}
