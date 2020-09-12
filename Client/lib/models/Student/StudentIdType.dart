import 'package:Client/models/Base/BaseModel.dart';

class StudentIdType extends BaseModel {
  int branchId;
  String codeName;
  int noOfDigits = 0;
  String seperator;

  @override
  StudentIdType.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['studentIdTypeId']);
    branchId = toInt(map['branchId']);
    codeName = map['codeName'];
    noOfDigits = toInt(map['noOfDigits']);
    seperator = map['seperator'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentIdTypeId": id,
      "branchId": branchId,
      "codeName": codeName,
      "noOfDigits": noOfDigits,
      "seperator": seperator,
    });
    return map;
  }
}
