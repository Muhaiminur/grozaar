# grozaar

Grozaar

## Getting Started

For Apk Build
-- flutter build apk --flavor dev

For dev

APK

flutter build apk --flavor dev -t lib/main.dart && \
firebase appdistribution:distribute build/app/outputs/flutter-apk/app-dev-release.apk  \
--app 1:481270449972:android:b893c7cce10aad8309c761  \
--release-notes "do not download" --groups "tester-group"

App Bundle

flutter build appbundle --flavor dev -t lib/main.dart

For prod you can use:

APK

flutter build apk --flavor prod -t lib/main_prod.dart

flutter run --release --flavor prod -t lib/main_prod.dart

App Bundle

flutter build appbundle --flavor prod -t lib/main_prod.dart