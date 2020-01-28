///TODO: Model class provinsi
class ProvinceModel {
  String id;
  String name;
  ProvinceModel({
    this.id,
    this.name,
  });
  factory ProvinceModel.getProvince(Map<String, dynamic> json) => ProvinceModel(
        id: json['id'].toString(),
        name: json['nama'],
      );
}
