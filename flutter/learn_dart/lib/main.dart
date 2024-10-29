import 'package:flutter/material.dart';
import 'package:learn_dart/dart_basics_01.dart';

void main() {
  hexFormat();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
