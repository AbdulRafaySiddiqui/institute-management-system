import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/export.dart';

class StudentSubgroupModel extends BaseModel {
  StudentSubgroupModel({int id, this.subgroupId}) : super(id: id);
  int studentId;
  int subgroupId;
  SubgroupModel subgroup;

  @override
  StudentSubgroupModel.fromJson(Map<String, dynamic> map)
      : super.fromJson(map) {
    studentId = toInt(map['studentId']);
    subgroupId = toInt(map['subgroupId']);
    subgroup = map["subgroup"] == null
        ? null
        : SubgroupModel.fromJson(map["subgroup"]);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentId": studentId,
      "subgroupId": subgroupId,
      "subgroup": subgroup?.toJson()
    });
    return map;
  }
}
