import 'package:Client/controllers/FieldViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/Enum/PersonType.dart';
import 'package:Client/models/Enum/ValidationType.dart';
import 'package:Client/models/Enum/InputMethod.dart';
import 'package:Client/models/Field/FieldModel.dart';
import 'package:Client/models/Field/FieldValueModel.dart';
import 'package:Client/service/DialogService/DialogService.dart';
import 'package:Client/service/api/FieldApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FieldView extends StatelessWidget {
  final controller = Get.put(FieldViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: FieldModel().toJson()),
        updateForm: Obx(
          () => _form(
              isUpdateForm: true, value: controller.selectedItem?.toJson()),
        ),
        listCard: Obx(
          () => BaseListCard(
            isLoading: controller.isFetchingData.value,
            filters: [
              DropdownButton(
                  value: controller.selectedPersonType.value,
                  items: PersonType.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.displayName)))
                      .toList(),
                  onChanged: (value) => controller.selectedPersonType(value))
            ],
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Input Method')),
              DataColumn(label: Text('Required Status')),
              DataColumn(label: Text('Action')),
            ],
            rows: List.generate(controller.itemsList.length, (i) {
              var item = controller.itemsList[i];
              var isBusy = false.obs;
              return DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(Text(item.validationType.displayName)),
                    DataCell(Text(item.inputMethod.displayName)),
                    DataCell(
                        Text(item.isRequired ? "Required" : "Not Required")),
                    DataCell(
                      Obx(
                        () => isBusy.value
                            ? Center(child: CircularProgressIndicator())
                            : Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.arrow_upward),
                                      onPressed: () async {
                                        isBusy(true);
                                        await controller.changeFieldOrderIndex(
                                            moveUpward: true, model: item);
                                        isBusy(false);
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.arrow_downward),
                                      onPressed: () async {
                                        isBusy(true);
                                        await controller.changeFieldOrderIndex(
                                            moveUpward: false, model: item);
                                        isBusy(false);
                                      })
                                ],
                              ),
                      ),
                    )
                  ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  var controller = Get.put(FieldViewController());

  //list of default values
  final defaultValues =
      <FieldValueModel>[FieldValueModel(), FieldValueModel()].obs;

  //true if input method supports multiple default values(e.g for combobox)
  final showValues = false.obs;

  //true if input method supports single default values(e.g for checkbox)
  final showSingleValue = false.obs;

  //calculate the showValues && showSingleValue properties according to the selected input method
  void _inputMethodChanged(value) {
    if (value == InputMethod.ComboBox.index ||
        value == InputMethod.EditableComboBox.index ||
        value == InputMethod.RadioButton.index)
      showValues.value = true;
    else
      showValues.value = false;

    if (value == InputMethod.CheckBox.index)
      showSingleValue.value = true;
    else
      showSingleValue.value = false;
  }

  //calculate the order index for new field
  if (!isUpdateForm && value != null) {
    value["orderIndex"] = controller.itemsList.length > 0
        ? controller.itemsList
            .reduce(
                (curr, next) => curr.orderIndex > next.orderIndex ? curr : next)
            ?.orderIndex
        : 0;
  }

  if (isUpdateForm && value != null) {
    //map all default values's key & value outside of the nested list,
    //so form builder can bind to them and can set initial values
    //(NOTE: form buidler don't support nested initialvalues yet, this is just a workaround for that)
    var values = value["defaultValues"] as List;
    if (values != null) {
      int i = 0;
      for (var item in values) {
        value["defaultValues.key.$i"] = item["fieldValueId"];
        value["defaultValues.value.${i++}"] = item["value"];
      }
    }

    //extract the defaultValues json list from map and recreate field value list for form builder to generate textfields
    if (value["defaultValues"] is List) {
      defaultValues.value = (value["defaultValues"] as List)
          .map((e) => FieldValueModel.fromJson(e))
          .toList();
    }

    _inputMethodChanged(value["inputMethod"]);
  }

  return BaseForm<FieldViewController, FieldModel, FieldApi>(
    itemName: EntityNames.fieldName,
    isUpdateForm: isUpdateForm,
    initialValue: value,
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'name',
        decoration: InputDecoration(labelText: "Name"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(100)
        ],
      ),
      FormBuilderDropdown(
        attribute: 'personType',
        decoration: InputDecoration(labelText: "Entity"),
        validators: [
          FormBuilderValidators.required(),
        ],
        items: PersonType.values
            .map((e) =>
                DropdownMenuItem(value: e.index, child: Text(e.displayName)))
            .toList(),
      ),
      FormBuilderDropdown(
        attribute: 'validationType',
        decoration: InputDecoration(labelText: "Type"),
        validators: [
          FormBuilderValidators.required(),
        ],
        items: ValidationType.values
            .map((e) =>
                DropdownMenuItem(value: e.index, child: Text(e.displayName)))
            .toList(),
      ),
      FormBuilderDropdown(
        attribute: 'inputMethod',
        decoration: InputDecoration(labelText: "Input Method"),
        validators: [
          FormBuilderValidators.required(),
        ],
        items: InputMethod.values
            .map((e) =>
                DropdownMenuItem(value: e.index, child: Text(e.displayName)))
            .toList(),
        onChanged: (value) => _inputMethodChanged(value),
      ),
      FormBuilderCheckbox(
        attribute: 'isRequired',
        label: Text("Required"),
      ),
      Obx(
        () => !showSingleValue.value
            ? Container()
            : FormBuilderTextField(
                attribute: 'defaultValue.value.0',
                decoration: InputDecoration(labelText: "Value"),
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(100)
                ],
              ),
      ),
      Obx(
        () => !showValues.value
            ? Container()
            : Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Default Values",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                        //Add default value Button
                        IconButton(
                            color: Get.theme.primaryColor,
                            icon: Icon(Icons.add),
                            onPressed: () =>
                                defaultValues.add(FieldValueModel()))
                      ],
                    ),
                    //Default Values
                    ...List.generate(
                      defaultValues.length,
                      (index) => Row(
                        children: [
                          Expanded(
                            child: FormBuilderTextField(
                              attribute: "defaultValues.value.$index",
                              decoration: InputDecoration(labelText: "Value"),
                              validators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(100)
                              ],
                            ),
                          ),
                          IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                if (index < 2) {
                                  DialogService.showWarningDialog(
                                      message:
                                          "Must provide atleast two values.");
                                  return;
                                }
                                defaultValues.remove(defaultValues[index]);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ],
  );
}
