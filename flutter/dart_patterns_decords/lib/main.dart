import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({required this.document, super.key});

  String formatDate(DateTime dateTime) {
    var today = DateTime.now();
    var difference = dateTime.difference(today);
    return switch (difference) {
      Duration(inDays: 0) => 'Today',
      Duration(inDays: 1) => 'tomorrow',
      Duration(inDays: -1) => 'yesterday',
      Duration(inDays: var days) when days > 7 => '${days ~/ 7} weeks from now',
      Duration(inDays: var days) when days < -7 =>
        '${days.abs() ~/ 7} weeks ago',
      Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
      Duration(inDays: var days) => '$days days from now',
    };
  }

  @override
  Widget build(BuildContext context) {
    // metadataからtitleとmodifiedを取得
    // パターンを使ってレコードを分解して取得している
    // :modified は modified: modifiedの省略形、ローカル変数名を変更する場合は modified: localModified で変更できる
    var (title, :modified) = document.getMetadata();
    var formattedModifiedDate = formatDate(modified);
    var blocks = document.getBlocks();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Text('Last modified $formattedModifiedDate'),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({required this.block, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;
    textStyle = switch (block.type) {
      'h1' => Theme.of(context).textTheme.displayMedium,
      'p' || 'checkbox' => Theme.of(context).textTheme.bodyMedium,
      _ => Theme.of(context).textTheme.bodySmall
    };
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(block.text, style: textStyle),
    );
  }
}
