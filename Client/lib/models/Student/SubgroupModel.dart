import 'package:Client/models/Base/BaseModel.dart';

class SubgroupModel extends BaseModel {
  SubgroupModel({int id, this.name}) : super(id: id);
  int groupId;
  String name;

  @override
  SubgroupModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['subgroupId']);
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
