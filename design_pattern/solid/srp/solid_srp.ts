import { writeFile } from "fs/promises"

class Journal {
  private entries: string[] = []
  private count: number = 0

  addEntry(text: string): number {
    this.entries.push(`${++this.count}: ${text}`)
    return this.count
  }

  removeEntry(index: number): void {
    this.entries.splice(index, 1)
  }

  toString(): string {
    return this.entries.join("\n")
  }

  getEntries(): string[] {
    return this.entries
  }
}

class Persistence {
  constructor(private readonly lineSeparator: string = "\n") {}

  async saveToFile(journal: Journal, filename: string): Promise<void> {
    const content = journal.getEntries().join(this.lineSeparator)
    await writeFile(filename, content, "utf8")
  }
}

async function main() {
  const journal = new Journal()
  journal.addEntry("I cried today.")
  journal.addEntry("I ate a bug.")
  console.log(journal.toString())

  const persistence = new Persistence("\r\n")
  await persistence.saveToFile(journal, "journal.txt")
}

main().catch(console.error)
