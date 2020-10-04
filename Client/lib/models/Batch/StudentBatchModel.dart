import 'package:Client/models/Base/BaseModel.dart';

class StudentBatchModel extends BaseModel {
  StudentBatchModel({int id, this.batchId}) : super(id: id);
  int studentId;
  int batchId;

  @override
  StudentBatchModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    studentId = toInt(map['studentId']);
    batchId = toInt(map['batchId']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentId": studentId,
      "batchId": batchId,
    });
    return map;
  }
}
