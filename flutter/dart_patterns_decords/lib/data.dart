import 'dart:convert';
import 'dart:io';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  // レコードを返すメソッド
  // Stringは無名のフィールド $1 としてアクセスできる
  // DateTimeは modified としてアクセスできる
  // (String, {DateTime modified}) getMetadata() {
  //   var title = "My Document";
  //   var now = DateTime.now();

  // かっこで２つの値を囲無事でレコードを構築して返す
  // return (title, modified: now);
  // }

  // パターンを利用せずにJSONを読み取るメソッド
  (String, {DateTime modified}) getMetadataWithoutPattern() {
    if (_json.containsKey('metadata')) {
      var metadataJson = _json['metadata'];
      if (metadataJson is Map) {
        var title = metadataJson['title'] as String;
        var localModified = DateTime.parse(metadataJson['modified'] as String);
        return (title, modified: localModified);
      }
    }
    throw const FormatException('Unexpected JSON');
  }

  // パターンを使ってJSONを読み取るメソッド
  (String, {DateTime modified}) getMetadata() {
    // if-caseを使ってJSONを読み取る
    if (_json
        case {
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
        }) {
      // if-caseで比較したパターンがマッチした場合に実行される
      return (title, modified: DateTime.parse(localModified));
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }

  // Blockのリストを返すメソッド
  List<Block> getBlocks() {
    // if case を使って JSON の blocks　を blocksJson　として取得
    if (_json case {'blocks': List blocksJson}) {
      return <Block>[
        for (var blockJson in blocksJson) Block.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

class Block {
  final String type;
  final String text;
  Block(this.type, this.text);

  factory Block.fromJson(Map<String, dynamic> json) {
    if (json case {'type': var type, 'text': var text}) {
      return Block(type, text);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2024-10-22"
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
