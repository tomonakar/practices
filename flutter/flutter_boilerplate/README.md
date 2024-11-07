# My First Flutter Boilerplate

This is a Flutter application boilerplate that adopts Layered Architecture and Riverpod.

## Features
- 📱 Layered Architecture
- 🛠 Riverpod for State Management
- 🎨 Multiple Flavors (Development, Staging, Production)
- 📊 Analytics Integration (Firebase & Mixpanel)
- 🐛 Error Tracking with Sentry
- 💰 Monetization with App in Purchase and AdMob
- 🔄 Force Update
- ⭐️ App Review
- 📝 User Feedback Form for Feature Requests and Bug Reports
- 🧪 Test Ready Structure


## Project Structure

```
lib/
├── app/
│   ├── analytics/             # Analytics
│   ├── sentry/                # Error Tracking
│   └── config/                # App Configuration
├── core/
│   ├── constants/             # constants
│   ├── errors/                # error handlings
│   ├── extensions/            # extension methods
│   └── utils/                 # utils
├── data/
│   ├── datasources/           # Data Douses
│   ├── models/                # DTO Models
│   └── repositories/          # Repository Implements
├── domain/
│   ├── entities/              # Domain Entities
│   └── repositories/          # Repository Interfaces
├── usecases/
│   ├── base/
│   │   └── base_usecase.dart           # usecase base class
│   ├── providers/
│   │   └── usecase_providers.dart
│   └── user/                           # usecase impl examples
│       ├── get_user/
│       │   ├── get_user_usecase.dart
│       │   └── get_user_params.dart
│       └── update_user/
│           ├── update_user_usecase.dart
│           └── update_user_params.dart
└── presentation/
    ├── pages                            # Screens
    │   └── user/                        # example | user
    │       ├── user_page.dart           # page
    │       ├── user_controller.dart     # controller
    │       └── user_state.dart          # state
    ├── widgets/                         # common widgets
    └── providers/                       # providers
```

## Getting Started

1. Set up the project
```bash
make set
```

2. Run code generation
```bash
make codegen
```

3. Run the app for each environment

```bash
# Development
make run-dev

# Staging
make run-stg

# Production
make run-prod
```

### Configuration

The configuration for each environment is managed in `lib/app/config/flavor/flavor_values.dart`.


### Testing

```bash
make test
```



## Set App Icon

1. アイコン画像のセット
- `assets/common` にios用のアイコンをセットする
- `assets/android` に Android用アイコンをセットする



2. パッケージの追加
```bash
dart pub add dev:flutter_launcher_icons:0.14.1
flutter pub get
```

3. Add Flutter Launcher Icons configuration

```yml

flutter:
  uses-material-design: true
  assets:
    - assets/common/

# Flutter Launcher Icons configuration
flutter_launcher_icons:
  ios: true
  android: true
  image_path_ios: "assets/common/app-icon.png"
  image_path_ios_dark_transparent: "assets/common/app-icon-transparent.png"
  image_path_android: "assets/android/app-icon-android.png"
  adaptive_icon_background: "assets/android/app-icon-background.png"
  adaptive_icon_foreground: "assets/android/app-icon-foreground.png"
  remove_alpha_ios: true
  web:
    generate: true
    image_path: "assets/common/app-icon.png"
```

`remove_alpha_ios: true` : alpha channelを持つアイコンはApple App Storeでは許可されてないため、このフラグをTrueにする。

4. Run Command

```bash
dart run flutter_launcher_icons

Building package executable... 
Built flutter_launcher_icons:flutter_launcher_icons.
  ════════════════════════════════════════════
     FLUTTER LAUNCHER ICONS (v0.14.1)                               
  ════════════════════════════════════════════
  
• Creating default icons Android
• Overwriting the default Android launcher icon with a new icon
• Creating adaptive icons Android
• Creating mipmap xml file Android
• Overwriting default iOS launcher icon with new icon
• Overwriting default iOS dark launcher icon with new icon
Creating Icons for Web...              done

✓ Successfully generated launcher icons

```


#### Tips
- Androidは [adaptive icons](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive?hl=ja) を採用している
- Launcher Icon Guidelines
  - **Keep it simple**: Simple icons are easier for people to understand and recognize
  - **Multiple platforms**: Ensure your icon design works well on multiple platforms
  - **Avoid text** or only include if it’s an essential part of your brand
  - **Ensure good contrast** between the icon and its background color

- [App Icons guidelines](https://developer.apple.com/design/human-interface-guidelines/app-icons)
- [Google Play icon design specifications](https://developer.android.com/distribute/google-play/resources/icon-design-specifications?hl=ja)
- アイコンは `1024 x 1024px` ・ `no transparency` で作成するのが無難
- Androidのadaptive iconsをデザインする際の経験則
  - foreground/backgroundそれぞれ 1024x1024px のレイヤーを作成する
  - foregroundの画像は 50％（512px）になるように調整する
- iOS iconは、75％ になるように調整する
- `ios/Runner/Assets.xcassets/AppIcon.appiconset` をチェックして不要な childがある場合は削除すること


## Set Splash Screen
1. Add Package
```bash
dart pub add dev:flutter_native_splash:2.4.1
flutter pub get
```
2. add configuration to pubspec.yaml
```yaml
# Flutter Native Splash configuration
flutter_native_splash:
  color: "#ffffff"
  color_android: "#ffffff"
  color_dark_android: "#121212"
  color_ios: "#ffffff"
  color_dark_ios: "#121212"
  color_web: "#ffffff"
  color_dark_web: "#121212"
  image: "assets/android/app-icon-foreground.png"

```
3. Run command
```bash
dart run flutter_native_splash:create
```

### Tips
- [Supported Parameters](https://pub.dev/packages/flutter_native_splash#1-setting-the-splash-screen)