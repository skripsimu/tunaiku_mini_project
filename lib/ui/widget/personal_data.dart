import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/bloc/education_bloc.dart';
import 'package:tunaiku_mini_project/library/initial.dart';

import '../../bloc/education_bloc.dart';
import '../../library/initial.dart';
import '../../ui/ktp_page.dart';

class PersonalData {
  TextEditingController _noKtp = TextEditingController();
  TextEditingController _namaLengkap = TextEditingController();
  TextEditingController _noRekening = TextEditingController();
  TextEditingController _tanggalLahir = TextEditingController();

  Education dropdownValue;
  body(BuildContext context) {
    EducationBloc bloc = BlocProvider.of<EducationBloc>(context);
    return Stack(
      children: <Widget>[
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
                    "Data Diri",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  defaultForm.getForm(
                    title: "No KTP",
                    textController: _noKtp,
                    context: context,
                    hint: "Masukan 16 nomor KTP anda",
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                  ),
                  defaultForm.getForm(
                    title: "Nama Lengkap",
                    textController: _namaLengkap,
                    context: context,
                    hint: "Masukan nama lengkap anda",
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                  ),
                  defaultForm.getForm(
                    title: "Nomor Rekening",
                    textController: _noRekening,
                    context: context,
                    hint: "Masukan nomor rekening anda",
                    maxLength: 255,
                    keyboardType: TextInputType.number,
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
                          "Tingkat Pendidikan",
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
                            child: BlocBuilder<EducationBloc, String>(
                              builder: (context, getEducation) =>
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
                                items: Education.values.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item
                                        .toString()
                                        .toString()
                                        .substring(10, item.toString().length)),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print(value);
                                  bloc.add(value);
                                  dropdownValue = value;
                                  print(getEducation);
                                },
                                value: dropdownValue,
                              ),
                            ),
                          )),
                    ],
                  ),
                  datePicker.getDate(
                    textController: _tanggalLahir,
                    title: "Masukan tanggal lahir anda",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton.getButton(
                    title: "Submit",
                    function: () {
                      if (_noKtp.text.length == 0) {
                        customToast.showToast(msg: "No KTP tidak boleh kosong");
                      } else if (_namaLengkap.text.length == 0) {
                        customToast.showToast(msg: "Nama tidak boleh kosong");
                      } else if (_noRekening.text.length == 0) {
                        customToast.showToast(
                            msg: "Nomor Rekening tidak boleh kosong");
                      } else if (_noRekening.text.length < 8) {
                        customToast.showToast(
                            msg: "Minimal panjang rekening 8 digit");
                      } else if (dropdownValue == null) {
                        customToast.showToast(
                            msg: "Pendidikan tidak boleh kosong");
                      } else if (_tanggalLahir.text.length == 0) {
                        customToast.showToast(
                            msg: "Tanggal lahir tidak boleh kosong");
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => KtpPage()));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
