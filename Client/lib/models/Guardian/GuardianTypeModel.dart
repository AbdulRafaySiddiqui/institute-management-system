import 'package:Client/models/Base/BaseModel.dart';

class GuardianTypeModel extends BaseModel {
  GuardianTypeModel();

  String name;

  @override
  GuardianTypeModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['guardianTypeId']);
    name = map['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "guardianTypeId": id,
      "name": name,
    });
    return map;
  }
}
