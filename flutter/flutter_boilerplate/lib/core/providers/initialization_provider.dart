import 'package:flutter_boilerplate/data/providers/database_provider.dart';
import 'package:flutter_boilerplate/data/providers/datasource_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initialization_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> initialization(Ref ref) async {
  // 初期化の順序を明示的に定義
  await Future.wait([
    ref.watch(sharedPreferencesProvider.future),
    ref.watch(databaseProvider.future),
  ]);

  // データソースの初期化
  await Future.wait([
    ref.watch(authLocalDataSourceProvider.future),
    ref.watch(userLocalDataSourceProvider.future),
  ]);

  return true; // 初期化完了を示すtrueを返す
}
