import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Fee/FeeTypeModel.dart';

class BatchFeeTypeModel extends BaseModel {
  BatchFeeTypeModel({int id}) : super(id: id);
  int batchId;
  int amount = 0;
  int lateFee = 0;
  int dueDay = 10;

  int feeTypeId;
  FeeTypeModel feeType;

  @override
  BatchFeeTypeModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['batchFeeTypeId']);
    feeTypeId = toInt(map["feeTypeId"]);
    batchId = toInt(map["batchId"]);
    amount = toInt(map["amount"]);
    lateFee = toInt(map['lateFee']);
    dueDay = toInt(map['dueDay']);
    feeType =
        map["feeType"] != null ? FeeTypeModel.fromJson(map["feeType"]) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "batchFeeTypeId": id,
      "feeTypeId": feeTypeId,
      "batchId": batchId,
      "amount": amount,
      "lateFee": lateFee,
      "dueDay": dueDay,
      "feeType": feeType?.toJson()
    });
    return map;
  }
}
