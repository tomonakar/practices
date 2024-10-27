import 'package:flutter/material.dart';

class MyCounter extends StatelessWidget {
  final int count;
  const MyCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}

/**
 * 利用側は以下のようになる
 * Column(
 *  children: [
 *   MyCounter(count: count),
 *   TextButton(
 *     child: Text('Increment'),
 *     onPress: () => setState(() => count++)),
 *   ],
 * )
 */
