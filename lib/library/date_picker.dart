import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  getDate({TextEditingController textController, String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 60, right: 60, top: 20),
          child: Text(
            "Tanggal Lahir",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Card(
          margin: EdgeInsets.only(left: 40, right: 40),
          elevation: 11,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: DateTimeField(
            controller: textController,
            decoration: InputDecoration(
                hintText: title,
                hintStyle: TextStyle(color: Colors.black26),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
            format: DateFormat("dd-MM-yyy"),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
        ),
      ],
    );
  }
}
