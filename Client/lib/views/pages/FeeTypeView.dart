import 'package:Client/controllers/FeeTypeController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Fee/FeeTypeModel.dart';
import 'package:Client/service/api/FeeTypeApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FeeTypeView extends StatelessWidget {
  final controller = Get.put(FeeTypeViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: FeeTypeModel().toJson()),
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
  if (!isUpdateForm && value != null) {
    value["branchId"] = currentBranchId;
  }
  return BaseForm<FeeTypeViewController, FeeTypeModel, FeeTypeApi>(
    itemName: EntityNames.feeTypeName,
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
    ],
  );
}
