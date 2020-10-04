import 'package:Client/models/Base/BaseModel.dart';

class DiscountModel extends BaseModel {
  DiscountModel({int id, this.amount, this.feeTypeId}) : super(id: id);
  int amount = 0;
  int studentId;
  int feeTypeId;

  @override
  DiscountModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['discountId']);
    amount = toInt(map['amount']);
    studentId = toInt(map['studentId']);
    feeTypeId = toInt(map['feeTypeId']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "discountId": id,
      "amount": amount,
      "studentId": studentId,
      "feeTypeId": feeTypeId,
    });
    return map;
  }
}
