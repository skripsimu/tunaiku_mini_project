import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownProvince extends Bloc<String, String> {
  String _province;
  @override
  String get initialState => "pilih provinsi";

  @override
  Stream<String> mapEventToState(String event) async* {
    _province = 
        (event == "Jawa Timur") ? "Jawa Timur"
        : (event == "Jawa Tengah") ? "Jawa Tengah"
        : (event == "Jawa Barat")? "Jawa Barat"
        : (event == "Dki Jakarta")? "Dki Jakarta"
        : (event == "Banten")? "Banten"
        : (event == "Bali") ? "Bali"
        : (event == "Di Yogyakarta") ? "Di Yogyakarta"
        : (event == "Aceh") ? "Aceh"
        : (event == "Sumatera Utara") ? "Sumatera Utara"
        : (event == "Sumatera Barat") ? "Sumatera Barat"
        : (event == "Sumatera Selatan") ? "Sumatera Selatan"
        : (event == "Riau") ? "Riau"
        : (event == "Jambi") ? "Jambi"
        : (event == "Bengkulu") ? "Bengkulu"
        : (event =="Lampung") ? "Lampung"
        : (event == "Kepulauan Bangka Belitung") ? "Kepulauan Bangka Belitung"
        : (event == "Kepulauan Riau") ? "Kepulauan Riau"
        : (event == "Nusa Tenggara Barat") ? "Nusa Tenggara Timur"
        : (event == "Kalimantan Barat") ? "Kalimantan Barat"
        : (event == "Kalimantan Timur") ? "Kalimantan Timur" 
        : (event == "Kalimantan Tengah") ? "Kalimantan Tengah" 
        : (event == "Kalimantan Selatan") ? "Kalimantan Selatan" 
        : (event == "Kalimantan Utara") ? "Kalimantan Utara" 
        : (event == "Sulawesi Utara") ? "Sulawesi Utara" 
        : (event == "Sulawesi Tengah") ? "Sulawesi Tengah" 
        : (event == "Sulawesi Selatan") ? "Sulawesi Selatan" 
        : (event == "Sulawesi Tenggara") ? "Sulawesi Tenggara" 
        : (event == "Sulawesi Barat") ? "Sulawesi Barat" 
        : (event == "Gorontalo") ? "Gorontalo" 
        : (event == "Maluku") ? "Maluku" 
        : (event == "Maluku Utara") ? "Maluku Utara" 
        : (event == "Papua") ? "Papua" : "Papua Barat";
    yield _province;
  }
}
