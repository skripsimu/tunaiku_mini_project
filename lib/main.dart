import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/bloc/address_bloc.dart';
import 'package:tunaiku_mini_project/bloc/dropdown_province_bloc.dart';
import 'package:tunaiku_mini_project/bloc/education_bloc.dart';
import 'package:tunaiku_mini_project/ui/home_page.dart';

import 'bloc/province_bloc.dart';
import 'ui/home_page.dart';

void main() => runApp(Tunaiku());

class Tunaiku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MultiBlocProvider(
      providers: [
        BlocProvider<EducationBloc>(create: (context) => EducationBloc()),
        BlocProvider<AddressBloc>(create: (context) => AddressBloc()),
        BlocProvider<ProvinceBloc>(create: (context) => ProvinceBloc()),
        BlocProvider<DropDownProvince>(create: (context) => DropDownProvince()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ));
  }
}
