import 'package:flutter/material.dart';
import 'package:tunaiku_mini_project/library/initial.dart';

class Review extends StatelessWidget {
  final String noKtp;
  final String nama;
  final String noRekening;
  final String pendidikan;
  final String tanggalLahir;
  final String alamat;
  final String tipeAlamat;
  final String blok;
  final String provinsi;
  Review({
    this.noKtp,
    this.nama,
    this.noRekening,
    this.pendidikan,
    this.tanggalLahir,
    this.alamat,
    this.tipeAlamat,
    this.blok,
    this.provinsi,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        waveView.waveDown(context),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Image(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 20,
          right: 20,
          child: Text(
            "Data Review",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 250,
          left: 20,
          right: 20,
          child: Card(
            elevation: 11,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              color: Colors.white10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  defaultText.body(
                    title: "Nama",
                    value: ": " + nama,
                  ),
                  defaultText.body(
                    title: "No KTP",
                    value: ": " + noKtp,
                  ),
                  defaultText.body(
                    title: "No Rekening",
                    value: ": " + noRekening,
                  ),
                  defaultText.body(
                    title: "Pendidikan",
                    value: ": " + pendidikan,
                  ),
                  defaultText.body(
                    title: "Alamat",
                    value: ": " + alamat,
                  ),
                  defaultText.body(
                    title: "Status Alamat",
                    value: ": " + tipeAlamat,
                  ),
                  defaultText.body(
                    title: "Provinsi",
                    value: ": " + provinsi,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 190,
          left: -15,
          child: RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: CircleBorder(),
            fillColor: Colors.red,
            child:
                Center(child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}
