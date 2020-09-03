import 'package:Client/models/BaseModel.dart';

class ClassModel extends BaseModel {
  ClassModel({int id, this.name}) : super(id: id);
  String name;
  int branchId;

  ClassModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['classId']);
    name = map['name'];
    branchId = map["branchId"];
  }

  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({"classId": id, "name": name, "branchId": branchId});
    return map;
  }
}
