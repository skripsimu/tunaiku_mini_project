import 'package:flutter/material.dart';

import '../library/initial.dart';

class KtpPage extends StatelessWidget {
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
