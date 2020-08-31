import 'package:Client/models/BaseModel.dart';

class BranchModel extends BaseModel {
  BranchModel({int id, this.name}) : super(id: id);
  String name;

  BranchModel.fromJson(Map<String, dynamic> map) {
    id = toInt(map['branchId']);
    name = map['name'];
  }

  Map<String, dynamic> toJson() => {
        "branchId": id,
        "name": name,
      };
}
