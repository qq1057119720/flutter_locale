
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterLocale {
  static const MethodChannel _channel = MethodChannel('flutter_locale');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<String> getSystemLocale() async {
    return await _channel.invokeMethod('getSystemLocale');
  }
}
