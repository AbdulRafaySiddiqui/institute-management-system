import 'package:Client/controllers/StudentIdTypeViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Student/StudentIdTypeModel.dart';
import 'package:Client/service/api/StudentIdTypeApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class StudentIdTypeView extends StatelessWidget {
  final controller = Get.put(StudentIdTypeViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: StudentIdTypeModel().toJson()),
        updateForm: Obx(
          () => _form(
              isUpdateForm: true, value: controller.selectedItem?.toJson()),
        ),
        listCard: Obx(
          () => BaseListCard(
            isLoading: controller.isFetchingData.value,
            columns: [
              DataColumn(label: Text('Code Name')),
              DataColumn(label: Text('Seperator')),
              DataColumn(label: Text('No Of Digits')),
            ],
            rows: List.generate(
              controller.itemsList.length,
              (i) => DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(controller.itemsList[i].codeName)),
                    DataCell(Text(controller.itemsList[i].seperator)),
                    DataCell(
                        Text(controller.itemsList[i].noOfDigits.toString())),
                  ]),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  if (!isUpdateForm && value != null) {
    value["branchId"] = currentBranchId;
  }
  if (value != null) {
    value["noOfDigits"] = value["noOfDigits"].toString();
  }
  return BaseForm<StudentIdTypeViewController, StudentIdTypeModel,
      StudentIdTypeApi>(
    itemName: EntityNames.studentIdTypeName,
    isUpdateForm: isUpdateForm,
    initialValue: value,
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'codeName',
        decoration: InputDecoration(labelText: "Code Name"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(100)
        ],
      ),
      FormBuilderTextField(
        attribute: 'seperator',
        decoration: InputDecoration(labelText: "Seperator"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(2)
        ],
      ),
      FormBuilderTextField(
        attribute: 'noOfDigits',
        decoration: InputDecoration(labelText: "No Of Digits"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric(),
          FormBuilderValidators.max(6),
        ],
      ),
    ],
  );
}
