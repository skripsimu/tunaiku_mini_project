import 'package:bloc/bloc.dart';

enum Education { SD, SMP, SMA, S1, S2, S3 }

class EducationBloc extends Bloc<Education, String> {
  String _education;
  @override
  String get initialState => "Pilih Pendidikan";

  @override
  Stream<String> mapEventToState(Education event) async* {
    _education = (event == Education.SD)
        ? "SD"
        : (event == Education.SMP)
            ? "SMP"
            : (event == Education.SMA)
                ? "SMA"
                : (event == Education.S1)
                    ? "S1"
                    : (event == Education.S2) ? "S2" : "S3";
    yield _education;
  }
}
