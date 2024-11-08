import 'package:flutter_boilerplate/app/config/flavor/app_flavor.dart';

class EnvConfig {
  final String apiUrl;
  final String appName;
  final AppFlavor flavor;

  const EnvConfig({
    required this.apiUrl,
    required this.appName,
    required this.flavor,
  });

  bool get isDevelopment => flavor == AppFlavor.development;
  bool get isStaging => flavor == AppFlavor.staging;
  bool get isProduction => flavor == AppFlavor.production;
}
