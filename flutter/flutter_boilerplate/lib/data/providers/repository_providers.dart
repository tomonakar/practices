// lib/data/providers/repository_providers.dart
import 'package:flutter_boilerplate/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_boilerplate/data/repositories/user/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'datasource_providers.dart';

part 'repository_providers.g.dart';

@riverpod
AuthRepository authRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);

  return AuthRepositoryImpl(remoteDataSource, localDataSource);
}

@riverpod
UserRepository userRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.watch(userRemoteDataSourceProvider);
  final remoteAuthDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(userLocalDataSourceProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);

  return UserRepositoryImpl(
    remoteDataSource,
    remoteAuthDataSource,
    localDataSource,
    authLocalDataSource,
  );
}
