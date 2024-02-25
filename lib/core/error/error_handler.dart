// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ErrorHandler {
  dynamic handle(
    dynamic method,
  ) {
    try {
      return method;
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
      if (e.isDatabaseClosedError()) {
        throw Exception("error");
      }
      throw Exception(e.toString());
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
