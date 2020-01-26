import 'package:flutter/material.dart';
import 'package:tunaiku_mini_project/library/initial.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: personalData.body(context),
    );
  }
}
