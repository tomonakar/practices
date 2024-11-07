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
│   ├── analytics/         # Analytics
│   ├── sentry/            # Error Tracking
│   └── config/            # App Configuration
├── core/                  # Common Functionalities
├── data/                  # Data Layer
├── domain/                # Domain Layer
├── usecases/              # Usecase Layer
└── presentation/          # Presentation Layer
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
