import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<void> showToast(String text, {Color? color = Colors.red}) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 14);
}
