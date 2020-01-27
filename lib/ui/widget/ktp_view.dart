import 'package:flutter/material.dart';

import '../../library/initial.dart';

class KtpView {
  TextEditingController _alamat = TextEditingController();
  body(BuildContext context) {
    return Stack(children: [
      waveView.body(context),
      ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Data KTP",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          defaultForm.getForm(
            title: "Alamat KTP",
            textController: _alamat,
            context: context,
            hint: "Masukan alamat anda",
            maxLength: 100,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
      Positioned(
        top: 35,
        left: -15,
        child: RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape: CircleBorder(),
          fillColor: Colors.red,
          child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
      ),
    ]);
  }
}
