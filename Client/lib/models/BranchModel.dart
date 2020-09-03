import 'package:Client/models/BaseModel.dart';

class BranchModel extends BaseModel {
  BranchModel({int id, this.name}) : super(id: id);
  String name;

  BranchModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['branchId']);
    name = map['name'];
  }

  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "branchId": id,
      "name": name,
    });
    return map;
  }
}
