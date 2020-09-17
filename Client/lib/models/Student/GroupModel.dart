import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Student/SubgroupModel.dart';

class GroupModel extends BaseModel {
  GroupModel({int id}) : super(id: id);
  int batchId;
  String name;
  List<SubgroupModel> subgroups = [];

  @override
  GroupModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['groupId']);
    batchId = toInt(map['batchId']);
    name = map['name'];
    subgroups = map['subgroups'] is List
        ? (map['subgroups'] as List)
            .map((e) => SubgroupModel.fromJson(e))
            .toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "groupId": id,
      "batchId": batchId,
      "name": name,
      "subgroups": subgroups?.map((e) => e.toJson())?.toList()
    });
    return map;
  }
}
