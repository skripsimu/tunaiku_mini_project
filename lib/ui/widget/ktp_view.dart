import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/bloc/address_bloc.dart';

import '../../library/initial.dart';

class KtpView {
  TextEditingController _alamat = TextEditingController();

  Address _dropdownValue;
  body(BuildContext context) {
    AddressBloc bloc = BlocProvider.of<AddressBloc>(context);
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 60,
                  right: 60,
                  top: 20,
                  bottom: 5,
                ),
                child: Text(
                  "Tipe Alamat",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Card(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  elevation: 11,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: BlocBuilder<AddressBloc, String>(
                      builder: (context, getEducation) => DropdownButton(
                        isExpanded: true,
                        hint: Container(
                          child: Text(
                            "Pilih Alamat",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        underline: Container(),
                        items: Address.values.map((item) {
                          return DropdownMenuItem(
                            child: Text(item
                                .toString()
                                .substring(8, item.toString().length)),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (value) {
                          print(value);
                          bloc.add(value);
                          _dropdownValue = value;
                          print(getEducation);
                        },
                        value: _dropdownValue,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
      Positioned(
        top: 35,
        left: -15,
        child: RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
            _alamat.text = "";
            _dropdownValue = null;
          },
          shape: CircleBorder(),
          fillColor: Colors.red,
          child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
      ),
    ]);
  }
}
