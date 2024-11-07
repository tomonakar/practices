import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/providers/env_provider.dart';
import 'package:flutter_boilerplate/core/providers/initialization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/config/flavor/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [
      envConfigProvider.overrideWithValue(FlavorConfig.development()),
    ],
  );

  // 初期化の完了を待つ
  await container.read(initializationProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
