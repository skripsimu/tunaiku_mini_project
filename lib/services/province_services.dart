import 'dart:convert';

import 'package:tunaiku_mini_project/model/province_model.dart';
import "package:http/http.dart" as http;

///TODO: Function to get list provinsi from API
class ProvinceServices {
  Future<List<ProvinceModel>> getProvince() async {
    String url = "http://dev.farizdotid.com/api/daerahindonesia/provinsi";
    var response = await http.get(url);
    var jsonObject = jsonDecode(response.body);
    var provinceData = (jsonObject as Map<String, dynamic>)['semuaprovinsi'];
    print(provinceData);
    return provinceData
        .map<ProvinceModel>((json) => ProvinceModel.getProvince(json))
        .toList();
  }
}
