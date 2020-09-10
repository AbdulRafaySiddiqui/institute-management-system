import 'package:Client/models/Base/BaseModel.dart';

class FeeTypeModel extends BaseModel {
  FeeTypeModel({int id, this.name}) : super(id: id);
  int branchId;
  String name;
  bool isIndividual = false;

  @override
  FeeTypeModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['feeTypeId']);
    branchId = map["branchId"];
    name = map['name'];
    isIndividual = map['isIndividual'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "feeTypeId": id,
      "branchId": branchId,
      "name": name,
      "isIndividual": isIndividual
    });
    return map;
  }
}
