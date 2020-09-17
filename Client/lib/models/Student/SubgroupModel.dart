import 'package:Client/models/Base/BaseModel.dart';

class SubgroupModel extends BaseModel {
  SubgroupModel({int id}) : super(id: id);
  int groupId;
  String name;

  @override
  SubgroupModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['groupId']);
    groupId = toInt(map['groupId']);
    name = map['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "subgroupId": id,
      "groupId": groupId,
      "name": name,
    });
    return map;
  }
}
