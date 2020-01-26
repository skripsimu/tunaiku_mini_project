import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/bloc/education_bloc.dart';
import 'package:tunaiku_mini_project/ui/home_page.dart';

void main() => runApp(Tunaiku());

class Tunaiku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<EducationBloc>(create: (context) => EducationBloc()),
        ],
        child: HomePage(),
      ),
    );
  }
}
