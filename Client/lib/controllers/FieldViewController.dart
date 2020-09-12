import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/models/Enum/PersonType.dart';
import 'package:Client/models/Field/FieldModel.dart';
import 'package:Client/models/Field/FieldValueModel.dart';
import 'package:Client/service/api/FieldApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FieldViewController extends BaseItemController<FieldModel, FieldApi> {
  @override
  FieldModel fromJson(Map<String, dynamic> map) => FieldModel.fromJson(map);

  final selectedPersonType = PersonType.Student.obs;

  @override
  List<FieldModel> get itemsList {
    var list = super
        .itemsList
        .where((e) => e.personType == selectedPersonType.value)
        .toList();
    list.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return list;
  }

  Future changeFieldOrderIndex(
      {@required bool moveUpward, @required FieldModel model}) async {
    if (model.orderIndex != 0 && model.orderIndex < itemsList.length - 1) {
      model.orderIndex =
          moveUpward ? model.orderIndex - 1 : model.orderIndex + 1;
      await updateItem(model.toJson());
    }
  }

  Map<String, dynamic> extractDefaultValues(Map<String, dynamic> map) {
    var item = FieldModel.fromJson(map);
    bool loop = true;
    int i = 0;
    List<FieldValueModel> defaultValues = [];
    while (loop) {
      var id = "defaultValues.id.$i";
      var value = "defaultValues.value.${i++}";
      if (map.containsKey(value)) {
        var fieldValue = FieldValueModel();
        fieldValue.value = map[value];
        if (map.containsKey(id)) {
          fieldValue.id = map[id];
        }
        defaultValues.add(fieldValue);
      } else {
        loop = false;
      }
    }
    item.defaultValues = defaultValues;
    return item.toJson();
  }

  @override
  Future<void> addItem(Map<String, dynamic> map) {
    var value = extractDefaultValues(map);
    return super.addItem(value);
  }

  @override
  Future<void> updateItem(Map<String, dynamic> map) {
    var value = extractDefaultValues(map);
    return super.updateItem(value);
  }
}
