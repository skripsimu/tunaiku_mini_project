import 'package:flutter/material.dart';

///TODO: Wrapped TextView Widget
class DefaultText {
  body({String title, value}) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black54)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            child: Text(title),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: value.toString().length > 18 ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
