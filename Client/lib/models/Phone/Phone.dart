import 'package:Client/models/Base/BaseModel.dart';

class PhoneModel extends BaseModel {
  PhoneModel({int id}) : super(id: id);
  String number;
  bool isSmsEnabled;

  @override
  PhoneModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['phoneId']);
    number = map['number'];
    isSmsEnabled = map['isSmsEnabled'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "phoneId": id,
      "number": number,
      "isSmsEnabled": isSmsEnabled,
    });
    return map;
  }
}
