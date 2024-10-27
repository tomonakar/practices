import 'dart:convert';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  // レコードを返すメソッド
  // Stringは無名のフィールド $1 としてアクセスできる
  // DateTimeは modified としてアクセスできる
  (String, {DateTime modified}) getMetadata() {
    var title = "My Document";
    var now = DateTime.now();

    // かっこで２つの値を囲無事でレコードを構築して返す
    return (title, modified: now);
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
