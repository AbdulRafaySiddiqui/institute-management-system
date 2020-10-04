import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Field/FieldModel.dart';

class StudentFieldModel extends BaseModel {
  StudentFieldModel({int id, this.field, this.fieldId, this.value})
      : super(id: id);
  String value;
  int studentId;
  int fieldId;
  FieldModel field;

  @override
  StudentFieldModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['phoneId']);
    studentId = toInt(map['studentId']);
    fieldId = toInt(map['fieldId']);
    value = map['value'];
    field = map['field'] == null ? null : FieldModel.fromJson(map['field']);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "studentFieldId": id,
      "studentId": studentId,
      "fieldId": fieldId,
      "value": value,
      "field": field?.toJson(),
    });
    return map;
  }
}
