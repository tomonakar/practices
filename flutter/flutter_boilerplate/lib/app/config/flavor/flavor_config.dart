import 'package:flutter_boilerplate/app/config/env.dart';
import 'package:flutter_boilerplate/app/config/flavor/app_flavor.dart';

class FlavorConfig {
  static EnvConfig development() {
    return const EnvConfig(
      apiUrl: 'https://dev-api.example.com',
      appName: 'MyApp Dev',
      flavor: AppFlavor.development,
    );
  }

  static EnvConfig staging() {
    return const EnvConfig(
      apiUrl: 'https://staging-api.example.com',
      appName: 'MyApp Staging',
      flavor: AppFlavor.staging,
    );
  }

  static EnvConfig production() {
    return const EnvConfig(
      apiUrl: 'https://api.example.com',
      appName: 'MyApp',
      flavor: AppFlavor.production,
    );
  }
}
