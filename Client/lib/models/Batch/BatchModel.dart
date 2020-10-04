import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Student/GroupModel.dart';

class BatchModel extends BaseModel {
  BatchModel({int id, this.name}) : super(id: id);
  String name;
  DateTime startDate;
  DateTime endDate;
  bool isActive = true;
  int classId;
  List<GroupModel> groups = [];

  BatchModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['batchId']);
    classId = toInt(map['classId']);
    name = map['name'];
    startDate = DateTime.parse(map["startDate"].toString());
    endDate = DateTime.parse(map["endDate"].toString());
    isActive = map["isActive"];
    groups = map['groups'] is List
        ? (map['groups'] as List).map((e) => GroupModel.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "batchId": id,
      "classId": classId,
      "name": name,
      "startDate": startDate?.toString(),
      "endDate": endDate?.toString(),
      "isActive": isActive,
      "groups": groups?.map((e) => e.toJson())?.toList()
    });
    return map;
  }
}
