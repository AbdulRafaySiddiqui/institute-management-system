import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Batch/StudentBatchModel.dart';
import 'package:Client/models/Fee/DiscountModel.dart';
import 'package:Client/models/Field/StudentField.dart';
import 'package:Client/models/Guardian/StudentGuardianModel.dart';
import 'package:Client/models/Phone/Phone.dart';
import 'package:Client/models/Photo/Photo.dart';
import 'package:Client/models/Student/StudentSubgroupModel.dart';

class StudentModel extends BaseModel {
  StudentModel({int id}) : super(id: id);
  int admissionNumber = 0;
  bool hasLeft = false;
  PhotoModel photo = PhotoModel();
  int studentIdTypeId = 0;
  List<PhoneModel> phones = [];
  List<StudentFieldModel> studentFields = [];
  List<StudentBatchModel> studentBatches = [];
  List<StudentSubgroupModel> studentSubgroups = [];
  List<StudentGuardianModel> studentGuardians = [];
  List<DiscountModel> discounts = [];

  @override
  StudentModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['studentId']);
    studentIdTypeId = toInt(map['studentIdTypeId']);
    admissionNumber = toInt(map['admissionNumber']);
    hasLeft = map['hasLeft'];
    photo = map["photo"] == null || map["photo"]["data"] == null
        ? null
        : PhotoModel.fromJson(map['photo']);
    phones = map['phones'] is List
        ? (map['phones'] as List)?.map((e) => PhoneModel.fromJson(e))?.toList()
        : null;
    studentFields = map['studentFields'] is List
        ? (map['studentFields'] as List)
            .map((e) => StudentFieldModel.fromJson(e))
            .toList()
        : null;
    studentBatches = map['studentBatches'] is List
        ? (map['studentBatches'] as List)
            ?.map((e) => StudentBatchModel.fromJson(e))
            ?.toList()
        : null;
    studentSubgroups = map['studentSubgroups'] is List
        ? (map['studentSubgroups'] as List)
            ?.map((e) => StudentSubgroupModel.fromJson(e))
            ?.toList()
        : null;
    studentGuardians = map['studentGuardians'] is List
        ? (map['studentGuardians'] as List)
            ?.map((e) => StudentGuardianModel.fromJson(e))
            ?.toList()
        : null;
    discounts = map['discounts'] is List
        ? (map['discounts'] as List)
            ?.map((e) => DiscountModel.fromJson(e))
            ?.toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentId": id,
      "admissionNumber": admissionNumber,
      "hasLeft": hasLeft,
      "photo": photo?.toJson(),
      "studentIdTypeId": studentIdTypeId,
      "phones": phones?.map((e) => e.toJson())?.toList(),
      "studentFields": studentFields?.map((e) => e.toJson())?.toList(),
      "studentBatches": studentBatches?.map((e) => e.toJson())?.toList(),
      "studentSubgroups": studentSubgroups?.map((e) => e.toJson())?.toList(),
      "studentGuardians": studentGuardians?.map((e) => e.toJson())?.toList(),
      "discounts": discounts?.map((e) => e.toJson())?.toList(),
    });
    return map;
  }
}
