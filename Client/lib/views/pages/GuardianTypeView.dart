import 'package:Client/controllers/GuardianTypeViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/Guardian/GuardianTypeModel.dart';
import 'package:Client/service/api/GuardianTypeApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class GuardianTypeView extends StatelessWidget {
  final controller = Get.put(GuardianTypeViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: GuardianTypeModel().toJson()),
        updateForm: Obx(
          () => _form(
              isUpdateForm: true, value: controller.selectedItem?.toJson()),
        ),
        listCard: Obx(
          () => BaseListCard(
            isLoading: controller.isFetchingData.value,
            columns: [
              DataColumn(label: Text('Name')),
            ],
            rows: List.generate(
              controller.itemsList.length,
              (i) => DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(controller.itemsList[i].name)),
                  ]),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  return BaseForm<GuardianTypeViewController, GuardianTypeModel,
          GuardianTypeApi>(
      inputWidgets: [
        FormBuilderTextField(
          attribute: 'name',
          decoration: InputDecoration(labelText: "Name"),
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(100)
          ],
        ),
      ],
      itemName: EntityNames.guardianType,
      isUpdateForm: isUpdateForm,
      initialValue: value);
}
