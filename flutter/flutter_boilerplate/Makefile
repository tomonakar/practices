.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Install dependencies
	flutter pub get

.PHONY: clean
clean: ## Clean the build
	flutter clean
	flutter pub get

.PHONY: format
format: ## Format the code
	dart format lib/
	dart format test/

.PHONY: analyze
analyze: ## Analyze the code
	flutter analyze

.PHONY: codegen
codegen: ## Generate code
	dart run build_runner build --delete-conflicting-outputs

.PHONY: codegen-watch
codegen-watch: ## Generate code and watch for changes
	dart run build_runner watch

.PHONY: test
test: ## Run tests
	flutter test

.PHONY: coverage
coverage: ## Run tests with coverage
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html

.PHONY: flavor
flavor: ## Set flavor environment
	dart run flutter_flavorizr

.PHONY: build-dev
build-dev: ## Build development
	flutter build apk --flavor development -t lib/main_development.dart

.PHONY: build-stg
build-stg: ## Build staging
	flutter build apk --flavor staging -t lib/main_staging.dart

.PHONY: build-prod
build-prod: ## Build production
	flutter build apk --flavor production -t lib/main_production.dart

.PHONY: run-dev
run-dev: ## Run development
	flutter run --flavor development -t lib/main_development.dart

.PHONY: run-stg
run-stg: ## Run staging
	flutter run --flavor staging -t lib/main_staging.dart

.PHONY: run-prod
run-prod: ## Run production
	flutter run --flavor production -t lib/main_production.dart

.PHONY: build-ios-dev
build-ios-dev: ## Build iOS development
	flutter build ios --flavor development -t lib/main_development.dart

.PHONY: build-ios-stg
build-ios-stg: ## Build iOS staging
	flutter build ios --flavor staging -t lib/main_staging.dart

.PHONY: build-ios-prod
build-ios-prod: ## Build iOS production
	flutter build ios --flavor production -t lib/main_production.dart

.PHONY: generate-icons
generate-icons: ## Generate icons
	flutter pub run flutter_launcher_icons

.PHONY: generate-splash
generate-splash: ## Generate splash screens
	flutter pub run flutter_native_splash:create

.PHONY: upgrade
upgrade: ## Upgrade dependencies
	flutter pub upgrade

.PHONY: outdated
outdated: ## Check outdated dependencies
	flutter pub outdated

.PHONY: doctor
doctor: ## Run flutter doctor
	flutter doctor -v