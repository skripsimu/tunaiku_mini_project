import 'package:bloc/bloc.dart';

enum Education { SD, SMP, SMA, S1, S2, S3 }

class EducationBloc extends Bloc<String, String> {
  String _education;
  @override
  String get initialState => "Pilih Pendidikan";

  @override
  Stream<String> mapEventToState(String event) async* {
    _education = (event == "SD")
        ? "SD"
        : (event == "SMP")
            ? "SMP"
            : (event == "SMA")
                ? "SMA"
                : (event == "S1") ? "S1" : (event == "S2") ? "S2" : "S3";
    yield _education;
  }
}
