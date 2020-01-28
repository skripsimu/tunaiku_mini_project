import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/bloc/address_bloc.dart';
import 'package:tunaiku_mini_project/bloc/dropdown_province_bloc.dart';
import 'package:tunaiku_mini_project/bloc/province_bloc.dart';
import 'package:tunaiku_mini_project/model/province_model.dart';
import 'package:tunaiku_mini_project/ui/review.dart';

import '../../library/initial.dart';

class KtpView {
  TextEditingController _alamat = TextEditingController();
  TextEditingController _blok = TextEditingController();

  Address _dropdownValue;
  String _provinceValue;
  body({
    BuildContext context,
    String noKtp,
    String nama,
    String noRekening,
    String pendidikan,
    String tanggalLahir,
  }) {
    AddressBloc bloc = BlocProvider.of<AddressBloc>(context);
    DropDownProvince blprov = BlocProvider.of<DropDownProvince>(context);
    return Stack(children: [
      waveView.body(context),
      ListView(
        children: <Widget>[
          Container(
            width: 700,
            child: Column(
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
                  digitsOnly: false,
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
                      ),
                    ),
                  ],
                ),
                defaultForm.getForm(
                  context: context,
                  hint: "Masukan nomor blok",
                  keyboardType: TextInputType.text,
                  maxLength: 100,
                  textController: _blok,
                  title: "Blok",
                  textCapitalization: TextCapitalization.characters,
                  digitsOnly: false,
                ),
                BlocBuilder<ProvinceBloc, List<ProvinceModel>>(
                  builder: (context, province) => Column(
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
                          "Provinsi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.only(left: 40, right: 40),
                          elevation: 11,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: BlocBuilder<DropDownProvince, String>(
                              builder: (context, getPendidikan) =>
                                  DropdownButton(
                                isExpanded: true,
                                hint: Container(
                                  child: Text(
                                    "Pilih tingkat pendidikan",
                                    style: TextStyle(
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                                underline: Container(),
                                items: province.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.name),
                                    value: item.name,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  _provinceValue = value;
                                  print("pendidikn $getPendidikan");
                                  print(value);
                                  blprov.add(value);
                                },
                                value: _provinceValue,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton.getButton(
                    title: "Submit",
                    function: () {
                      print(_blok.toString());
                      if (_alamat.text.length == 0) {
                        customToast.showToast(msg: "Alamat tidak boleh kosong");
                      } else if (_dropdownValue == null) {
                        customToast.showToast(
                            msg: "Tipe alamat tidak boleh kosong");
                      } else if (_blok.text.length == 0) {
                        customToast.showToast(msg: "Blok tidak boleh kosong");
                      } else if (_provinceValue == null) {
                        customToast.showToast(
                            msg: "Provinsi tidak boleh kosong");
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Review(
                                      nama: nama,
                                      noKtp: noKtp,
                                      noRekening: noRekening,
                                      pendidikan: pendidikan,
                                      tanggalLahir: tanggalLahir,
                                      alamat: _alamat.text,
                                      blok: _blok.text,
                                      provinsi: _provinceValue,
                                      tipeAlamat: _dropdownValue
                                          .toString()
                                          .substring(8,
                                              _dropdownValue.toString().length),
                                    )));
                      }
                    }),
              ],
            ),
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
            _blok.text = "";
            _dropdownValue = null;
            _provinceValue = null;
          },
          shape: CircleBorder(),
          fillColor: Colors.red,
          child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
      ),
    ]);
  }
}
