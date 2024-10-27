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

/// sealedは classの継承を制限するためのキーワード
/// ・ 同じライブラリ内でのみ継承可能
/// ・ 継承可能なクラスは同じファイル内で定義されている必要がある
/// クラスの設計をより厳密にし、意図しない継承を防ぐために使用される
///
/// sealed クラスは、 サブクラスが既知であることを保証するため、サブクラスを網羅的に処理するさ場合に便利
sealed class Block {
  Block();

  factory Block.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format')
    };
  }
}

class HeaderBlock extends Block {
  final String text;
  HeaderBlock(this.text);
}

class ParagraphBlock extends Block {
  final String text;
  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block {
  final String text;
  final bool isChecked;
  CheckboxBlock(this.text, this.isChecked);
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2024-10-18"
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
