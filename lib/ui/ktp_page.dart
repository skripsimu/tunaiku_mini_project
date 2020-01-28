import 'package:flutter/material.dart';

import '../library/initial.dart';

class KtpPage extends StatelessWidget {
  final String noKtp;
  final String nama;
  final String noRekening;
  final String pendidikan;
  final String tanggalLahir;
  KtpPage({
    this.noKtp,
    this.nama,
    this.noRekening,
    this.pendidikan,
    this.tanggalLahir,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ktpView.body(context),
      ),
    );
  }
}
