import 'package:bloc/bloc.dart';

enum Address { RUMAH, KANTOR }

class AddressBloc extends Bloc<Address, String> {
  String _address;
  @override
  String get initialState => "Pilih Alamat";

  @override
  Stream<String> mapEventToState(Address event) async* {
    _address = (event == Address.RUMAH) ? "RUMAH" : "KANTOR";
    yield _address;
  }
}
