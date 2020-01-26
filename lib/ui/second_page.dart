import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String ktp;
  final String nama;
  final String pendidikan;
  final String tanggalLahir;
  SecondPage({
    this.ktp,
    this.nama,
    this.pendidikan,
    this.tanggalLahir,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: Text(ktp),
      ),
    );
  }
}
