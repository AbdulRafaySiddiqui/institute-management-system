import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Batch/BatchModel.dart';

class ClassModel extends BaseModel {
  ClassModel({int id, this.name}) : super(id: id);
  String name;
  int branchId;

  List<BatchModel> batches;

  @override
  ClassModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['classId']);
    name = map['name'];
    branchId = map["branchId"];
    batches =
        (map["batches"] as List)?.map((e) => BatchModel.fromJson(e))?.toList();
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "classId": id,
      "name": name,
      "branchId": branchId,
      "batches": batches?.map((e) => e.toJson())?.toList()
    });
    return map;
  }
}
