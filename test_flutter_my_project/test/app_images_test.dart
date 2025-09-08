import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter_my_project/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.cross).existsSync(), isTrue);
  });
}
