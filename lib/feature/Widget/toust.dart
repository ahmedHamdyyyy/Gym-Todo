import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String text, required ToutsState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToutsState { SUCCESS, ERROR, WARNING }

Color choseToastColor(ToutsState state) {
  Color color;
  switch (state) {
    case ToutsState.SUCCESS:
      color = Colors.green;
      break;
    case ToutsState.ERROR:
      color = Colors.red;
      break;
    case ToutsState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}//  fluttertoast: ^8.0.9
