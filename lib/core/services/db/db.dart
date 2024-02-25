import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';

import '../../../config/constants/constant.dart';

class DBServices {
  late Database db;
  Future<bool> init() async {
    try {
      //final path = await getDatabasesPath();
      db = await openDatabase(
        'dbb.db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            '''
        CREATE TABLE ${Constant.customerTable} (
          ${Constant.id} TEXT, 
          ${Constant.name} TEXT, 
          ${Constant.phone} TEXT, 
          ${Constant.aDate} TEXT,
          ${Constant.eDate} TEXT,
          ${Constant.price} TEXT
        )''',
          );
        },
      );

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
