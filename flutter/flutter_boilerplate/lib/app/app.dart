import 'package:flutter/foundation.dart';
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
      home: _flavorBanner(
          message: config.appName,
          child: const SplashPage(),
          show: kDebugMode), // スプラッシュ画面から開始
    );
  }
}

Widget _flavorBanner({
  required String message,
  required Widget child,
  bool show = true,
}) =>
    show
        ? Banner(
            child: child,
            location: BannerLocation.topStart,
            message: message,
            color: Colors.green.withOpacity(0.6),
            textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
          )
        : Container(
            child: child,
          );
