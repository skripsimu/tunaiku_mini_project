import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultForm {
  getForm({
    BuildContext context,
    String hint,
    String title,
    int maxLength,
    TextInputType keyboardType,
    TextEditingController textController,
    TextCapitalization textCapitalization,
    bool digitsOnly,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 60, right: 60, top: 20),
        child: Text(
          title,
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
        child: TextFormField(
          controller: textController,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization == null
              ? TextCapitalization.sentences
              : textCapitalization,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
            (digitsOnly)
                ? WhitelistingTextInputFormatter.digitsOnly
                : BlacklistingTextInputFormatter.singleLineFormatter,
          ],
          maxLengthEnforced: true,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black26),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
        ),
      )
    ]);
  }
}
