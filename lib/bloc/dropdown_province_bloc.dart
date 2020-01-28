import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownProvince extends Bloc<String, String> {
  String _province;
  @override
  String get initialState => "pilih provinsi";

  @override
  Stream<String> mapEventToState(String event) async* {
    _province = (event == "Malang") ? "Malang" : "Surabaya";
    yield _province;
  }
}
