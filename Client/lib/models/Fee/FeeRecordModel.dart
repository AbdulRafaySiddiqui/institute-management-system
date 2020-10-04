import 'package:Client/models/Base/BaseModel.dart';

class FeeRecordModel extends BaseModel {
  FeeRecordModel({int id}) : super(id: id);
  int month;
  int year;
  int discount;
  bool isLateFeeApplicable;
  int studentId;
  int batchFeeTypeId;

  @override
  FeeRecordModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['feeRecordId']);
    month = toInt(map['month']);
    year = toInt(map['year']);
    discount = toInt(map['discount']);
    isLateFeeApplicable = map['isLateFeeApplicable'];
    studentId = toInt(map['studentId']);
    batchFeeTypeId = toInt(map['batchFeeTypeId']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "feeRecordId": id,
      "month": month,
      "year": year,
      "discount": discount,
      "isLateFeeApplicable": isLateFeeApplicable,
      "studentId": studentId,
      "batchFeeTypeId": batchFeeTypeId,
    });
    return map;
  }
}
