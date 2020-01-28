import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunaiku_mini_project/model/province_model.dart';

import '../library/initial.dart';

class ProvinceBloc extends Bloc<int, List<ProvinceModel>> {
  @override
  List<ProvinceModel> get initialState => [];

  @override
  Stream<List<ProvinceModel>> mapEventToState(int event) async* {
    try {
      List<ProvinceModel> province = await provinceServices.getProvince();
      yield province;
    } catch (_) {}
  }
}
