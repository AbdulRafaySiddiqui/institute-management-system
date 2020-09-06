import 'package:Client/models/BaseModel.dart';

class CourseModel extends BaseModel {
  CourseModel({int id, this.name}) : super(id: id);
  String name;
  String shortName;
  int classId;

  @override
  CourseModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['courseId']);
    classId = map["classId"];
    name = map['name'];
    shortName = map["shortName"];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "courseId": id,
      "name": name,
      "classId": classId,
      "shortName": shortName
    });
    return map;
  }
}
