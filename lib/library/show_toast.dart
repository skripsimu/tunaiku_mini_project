import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///TODO: Wrapped Toast Widget
class CustomToast {
  showToast({String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
    );
  }
}
