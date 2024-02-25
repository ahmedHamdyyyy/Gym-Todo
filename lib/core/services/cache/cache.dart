// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class CacheServices {
  late SharedPreferences shared;
  Future<bool> init() async {
    try {
      shared = await SharedPreferences.getInstance();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
