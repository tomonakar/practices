import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite3/sqlite3.dart';

part 'database_provider.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = path.join(appDir.path, 'app.db');

  final db = sqlite3.open(dbPath);

  // テーブルの作成
  db.execute('''
    CREATE TABLE IF NOT EXISTS users (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      profile_image_url TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      cache_time TEXT NOT NULL
    )
  ''');

  return db;
}
