package services_test

import (
	"database/sql"
	"fmt"
	"os"
	"testing"

	_ "github.com/go-sql-driver/mysql"
	"github.com/tomonakar/go_api_training/services"
)

// レシーバとして使うためのMyAppService構造体
var aSer *services.MyAppService

func TestMain(m *testing.M) {

	// --- テストの準備 ---
	// test用のDB接続
	dbUser := "docker"
	dbPassword := "docker"
	dbDatabase := "sampledb"
	dbConn := fmt.Sprintf("%s:%s@tcp(127.0.0.1:3306)/%s?parseTime=true", dbUser, dbPassword, dbDatabase)
	db, err := sql.Open("mysql", dbConn)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	aSer = services.NewMyAppService(db)

	// 個別のベンチマークテストを実施する

	m.Run()
}

// ベンチマークテストの関数名はBenchmarkで始める
// テストの実行はgo test -bench .で行う
func BenchmarkGetArticleService(b *testing.B) {
	// ベンチマークの取り方は、「処理時間を計測したい関数・メソッドを複数回実行しその平均を取る」 という方法で行われる
	// ベンチマークテストの実行回数はb.Nで取得できる
	articleID := 1

	// 前処理時間を計測時間に含めないようにb.ResetTimer()を実行する
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := aSer.GetArticleService(articleID)
		if err != nil {
			b.Error(err)
			break
		}

	}
}
