import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Enum/InputMethod.dart';
import 'package:Client/models/Enum/PersonType.dart';
import 'package:Client/models/Enum/ValidationType.dart';
import 'package:Client/models/Field/FieldValueModel.dart';

class FieldModel extends BaseModel {
  FieldModel({int id, this.name}) : super(id: id);
  PersonType personType = PersonType.Student;
  String name;
  bool isRequired = false;
  int orderIndex = 0;
  InputMethod inputMethod = InputMethod.TextField;
  ValidationType validationType = ValidationType.Text;
  List<FieldValueModel> defaultValues;

  @override
  FieldModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['fieldId']);
    name = map['name'];
    personType = PersonType.values[toInt(map['personType'])];
    isRequired = map['isRequired'];
    orderIndex = toInt(map['orderIndex']);
    inputMethod = InputMethod.values[toInt(map['inputMethod'])];
    validationType = ValidationType.values[toInt(map['validationType'])];
    defaultValues = map['defaultValues'] is List
        ? (map['defaultValues'] as List)
            .map((e) => FieldValueModel.fromJson(e))
            .toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "fieldId": id,
      "name": name,
      "personType": personType.index,
      "isRequired": isRequired,
      "orderIndex": orderIndex,
      "inputMethod": inputMethod.index,
      "validationType": validationType.index,
      "defaultValues": defaultValues?.map((e) => e.toJson())?.toList()
    });
    return map;
  }
}
