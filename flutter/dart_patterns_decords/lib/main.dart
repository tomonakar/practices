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

  @override
  Widget build(BuildContext context) {
    // metadataからtitleとmodifiedを取得
    // パターンを使ってレコードを分解して取得している
    // :modified は modified: modifiedの省略形、ローカル変数名を変更する場合は modified: localModified で変更できる
    var (title, :modified) = document.getMetadata();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last modified $modified'),
          ),
        ],
      ),
    );
  }
}
