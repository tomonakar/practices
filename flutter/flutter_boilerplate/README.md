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
