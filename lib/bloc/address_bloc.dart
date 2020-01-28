import 'package:bloc/bloc.dart';

enum Address { Rumah, Kantor }

class AddressBloc extends Bloc<Address, String> {
  String _address;
  @override
  String get initialState => "Pilih Alamat";

  @override
  Stream<String> mapEventToState(Address event) async* {
    _address = (event == Address.Rumah)
        ? "RUMAH"
        : (event == Address.Kantor) ? "KANTOR" : "Tidak ada";
    yield _address;
  }
}
