import 'package:Client/models/BaseModel.dart';

class BatchModel extends BaseModel {
  BatchModel({int id, this.name}) : super(id: id);
  String name;
  DateTime startDate;
  DateTime endDate;
  bool isActive = true;
  int classId;

  BatchModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['batchId']);
    classId = toInt(map['classId']);
    name = map['name'];
    startDate = DateTime.parse(map["startDate"].toString());
    endDate = DateTime.parse(map["endDate"].toString());
    isActive = map["isActive"];
  }

  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "batchId": id,
      "classId": classId,
      "name": name,
      "startDate": startDate?.toString(),
      "endDate": endDate?.toString(),
      "isActive": isActive
    });
    return map;
  }
}
