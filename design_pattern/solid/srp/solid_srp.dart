import 'dart:io';

class Journal {
  final List<String> entries = [];
  int count = 0;

  int addEntry(String text) {
    entries.add('${++count}: $text');
    return count;
  }

  void removeEntry(int index) {
    entries.removeAt(index);
  }

  @override
  String toString() => entries.join('\n');
}

class Persistence {
  final String lineSeparator;

  const Persistence({this.lineSeparator = '\n'});

  Future<void> saveToFile(Journal journal, String filename) async {
    final file = File(filename);
    await file.writeAsString(journal.entries.join(lineSeparator));
  }
}

void main() async {
  final journal = Journal();
  journal.addEntry('I cried today.');
  journal.addEntry('I ate a bug.');
  print(journal.toString());

  final persistence = Persistence(lineSeparator: '\r\n');
  await persistence.saveToFile(journal, 'journal.txt');
}
