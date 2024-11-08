import 'package:flutter_boilerplate/app/config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

@Riverpod(keepAlive: true)
EnvConfig envConfig(Ref ref) {
  throw UnimplementedError('Environment config must be initialized');
}
