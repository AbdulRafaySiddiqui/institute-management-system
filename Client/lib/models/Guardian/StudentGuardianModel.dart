import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Guardian/GuardianModel.dart';

class StudentGuardianModel extends BaseModel {
  StudentGuardianModel({int id}) : super(id: id);
  int studentId;
  int guardianId;
  GuardianModel guardian = GuardianModel();

  @override
  StudentGuardianModel.fromJson(Map<String, dynamic> map)
      : super.fromJson(map) {
    studentId = toInt(map['studentId']);
    guardianId = toInt(map['guardianId']);
    guardian = map['guardian'] == null
        ? null
        : GuardianModel.fromJson(map['guardian']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentId": studentId,
      "guardianId": guardianId,
      "guardian": guardian?.toJson()
    });
    return map;
  }
}
