import 'package:flutter/material.dart';

class DefaultButton {
  getButton({String title, Function function}) {
    return Card(
        elevation: 11,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: MaterialButton(
          minWidth: 200,
          height: 50,
          onPressed: function,
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
