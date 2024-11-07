import 'package:flutter_boilerplate/core/providers/initialization_provider.dart';
import 'package:flutter_boilerplate/data/providers/datasource_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_boilerplate/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_boilerplate/data/repositories/user/user_repository_impl.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  // 初期化完了を確認
  final isInitialized = ref.watch(initializationProvider).value ?? false;
  if (!isInitialized) {
    throw UnimplementedError('Initialization not completed');
  }

  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider).value!;

  return AuthRepositoryImpl(remoteDataSource, localDataSource);
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  // 初期化完了を確認
  final isInitialized = ref.watch(initializationProvider).value ?? false;
  if (!isInitialized) {
    throw UnimplementedError('Initialization not completed');
  }

  final remoteDataSource = ref.watch(userRemoteDataSourceProvider);
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(userLocalDataSourceProvider).value!;
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider).value!;

  return UserRepositoryImpl(
    remoteDataSource,
    authRemoteDataSource,
    localDataSource,
    authLocalDataSource,
  );
}
