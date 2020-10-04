import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Field/FieldModel.dart';

class GuardianFieldModel extends BaseModel {
  GuardianFieldModel(
      {int id, this.field, this.fieldId, this.value, this.guardianTypeId})
      : super(id: id);
  String value;
  int guardianId;
  int fieldId;
  int guardianTypeId;
  FieldModel field;

  @override
  GuardianFieldModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['phoneId']);
    guardianId = toInt(map['guardianId']);
    fieldId = toInt(map['fieldId']);
    guardianTypeId = toInt(map['guardianTypeId']);
    value = map['value'];
    field = map['field'] == null ? null : FieldModel.fromJson(map['field']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "guardianFieldId": id,
      "guardianId": guardianId,
      "fieldId": fieldId,
      "guardianTypeId": guardianTypeId,
      "value": value,
      "field": field?.toJson(),
    });
    return map;
  }
}
