import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/providers/env_provider.dart';
import 'package:flutter_boilerplate/presentation/pages/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 環境設定を取得
    final config = ref.watch(envConfigProvider);

    return MaterialApp(
      title: config.appName, // Flavorに応じたアプリ名
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: !config.isProduction, // 本番環境ではデバッグバナーを非表示
      home: const SplashPage(), // スプラッシュ画面から開始
    );
  }
}
