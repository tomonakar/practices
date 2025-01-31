package main

/// SRP (Single Responsibility Principle)
/// 1. クラスは変更する理由が１つだけでなければならない
/// 2. クラスは１つの責務だけを持つべきである

import (
	"fmt"
	"os"
	"strings"
)

var entryCount = 0

type Journal struct {
	entries []string
}

// String returns the journal entries as a string
func (j *Journal) String() string {
	return strings.Join(j.entries, "\n")
}

// AddEntry adds a new entry to the journal
func (j *Journal) AddEntry(text string) int {
	entryCount++
	entry := fmt.Sprintf("%d: %s", entryCount, text)
	j.entries = append(j.entries, entry)
	return entryCount
}

func (j *Journal) RemoveEntry(index int) {
	// ...
}

// SRP違反
// - Journal構造体が２つの責務を持っている
// - メモリ上の日記エントリの管理(本来の責務)
func (j *Journal) Save(filename string) {
	_ = os.WriteFile(filename, []byte(j.String()), 0644)
}

func (j *Journal) Load(filename string) {
	// ...
}

func (j *Journal) LoadFromWeb(url string) {
	// ...
}

var lineSeparator = "\n"

func SaveToFile(j *Journal, filename string) {
	_ = os.WriteFile(filename, []byte(strings.Join(j.entries, lineSeparator)), 0644)
}

// SRP違反を解消
// - Journal構造体は日記エントリの管理のみを担当
// - ファイルへの保存はPersistence構造体が担当
type Persistence struct {
	lineSeparator string
}

func (p *Persistence) SaveToFile(j *Journal, filename string) {
	_ = os.WriteFile(filename, []byte(strings.Join(j.entries, p.lineSeparator)), 0644)
}

func main() {
	j := Journal{}
	j.AddEntry("I cried today.")
	j.AddEntry("I ate a bug.")
	fmt.Println(j.String())

	// SaveToFile(&j, "journal.txt")

	p := Persistence{"\r\n"}
	p.SaveToFile(&j, "journal.txt")
}
