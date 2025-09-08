import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/widgets/app.dart';

void main() {
  // Включить только в режиме разработки
  if (kDebugMode) {
    runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => App(),
      ),
    );
  } else {
    runApp(App()); // В релизе — обычный запуск
  }
}
