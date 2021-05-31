import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:country_picker/country_picker.dart';

void main() {
  const MethodChannel channel = MethodChannel('country_picker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
