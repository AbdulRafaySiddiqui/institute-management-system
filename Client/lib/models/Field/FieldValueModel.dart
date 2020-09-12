import 'package:Client/models/Base/BaseModel.dart';

class FieldValueModel extends BaseModel {
  FieldValueModel({int id, this.value}) : super(id: id);
  String value;

  @override
  FieldValueModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['fieldValueId']);
    value = map['value'];
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "fieldValueId": id,
      "value": value,
    });
    return map;
  }
}
