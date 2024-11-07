// lib/data/providers/datasource_providers.dart
import 'package:flutter_boilerplate/data/datasources/local/implementations/user_local_data_source_impl.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/remote/implementations/auth_remote_data_source.impl.dart';
import 'package:flutter_boilerplate/data/datasources/remote/implementations/user_remote_data_source_impl.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_providers.dart';

part 'datasource_providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(apiClient);
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return UserRemoteDataSourceImpl(apiClient);
}

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSourceImpl();
}

@riverpod
Future<UserLocalDataSource> userLocalDataSource(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final db = await ref.watch(databaseProvider.future);
  return UserLocalDataSourceImpl(prefs, db);
}

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}
