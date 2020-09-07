import 'package:Client/models/Base/BaseModel.dart';

class ClassModel extends BaseModel {
  ClassModel({int id, this.name}) : super(id: id);
  String name;
  int branchId;

  @override
  ClassModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['classId']);
    name = map['name'];
    branchId = map["branchId"];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({"classId": id, "name": name, "branchId": branchId});
    return map;
  }
}
