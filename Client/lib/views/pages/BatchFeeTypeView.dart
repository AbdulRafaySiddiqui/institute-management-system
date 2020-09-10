import 'package:Client/controllers/BatchFeeTypeController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/Fee/BatchFeeTypeModel.dart';
import 'package:Client/service/api/BatchFeeType.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class BatchFeeTypeView extends StatelessWidget {
  final controller = Get.put(BatchFeeTypeViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: BatchFeeTypeModel().toJson()),
        updateForm: Obx(
          () => _form(
              isUpdateForm: true, value: controller.selectedItem?.toJson()),
        ),
        listCard: Obx(
          () => BaseListCard(
            isLoading: controller.isFetchingData.value,
            filters: [
              Obx(() {
                return DropdownButton(
                    hint: Text(EntityNames.className),
                    value: controller.selectedClass.value,
                    items: controller.classList
                        ?.map(
                          (e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e,
                          ),
                        )
                        ?.toList(),
                    onChanged: (value) => controller.selectClass(value));
              }),
              Obx(() {
                return DropdownButton(
                    hint: Text(EntityNames.batchName),
                    value: controller.selectedBatch.value,
                    items: controller.selectedClass.value?.batches
                        ?.map(
                          (e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e,
                          ),
                        )
                        ?.toList(),
                    onChanged: (value) => controller.selectBatch(value));
              }),
            ],
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Late Fee')),
              DataColumn(label: Text('Due Day')),
            ],
            rows: List.generate(
              controller.itemsList.length,
              (i) => DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(controller.itemsList[i].feeType.name)),
                    DataCell(Text(controller.itemsList[i].amount.toString())),
                    DataCell(Text(controller.itemsList[i].lateFee.toString())),
                    DataCell(Text(controller.itemsList[i].dueDay.toString())),
                  ]),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  final selectedClassIndex = Rx<int>();
  final controller = Get.put(BatchFeeTypeViewController());
  if (value != null) {
    value["amount"] = value["amount"].toString();
    value["lateFee"] = value["lateFee"].toString();
    value["dueDay"] = value["dueDay"].toString();
  }
  if (isUpdateForm && value != null) {
    selectedClassIndex.value = controller.classList.length > 0
        ? controller.classList
            ?.firstWhere(
                (c) => c.batches.any((b) => b.id == (value["batchId"] as int)))
            ?.id
        : null;
  }
  return BaseForm<BatchFeeTypeViewController, BatchFeeTypeModel,
      BatchFeeTypeApi>(
    itemName: EntityNames.batchFeeTypeName,
    isUpdateForm: isUpdateForm,
    initialValue: value,
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'amount',
        decoration: InputDecoration(labelText: "Amount"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric()
        ],
      ),
      FormBuilderTextField(
        attribute: 'lateFee',
        decoration: InputDecoration(labelText: "Late Fee"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric()
        ],
      ),
      FormBuilderTextField(
        attribute: 'dueDay',
        decoration: InputDecoration(labelText: "Due Day"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric()
        ],
      ),
      FormBuilderDropdown(
        attribute: "feeTypeId",
        decoration: InputDecoration(labelText: EntityNames.feeTypeName),
        validators: [FormBuilderValidators.required()],
        items: controller.feeTypeList
            .map((item) =>
                DropdownMenuItem(value: item.id, child: Text(item.name)))
            .toList(),
      ),
      Obx(() => DropdownButtonFormField(
          decoration: InputDecoration(labelText: EntityNames.className),
          isExpanded: true,
          value: selectedClassIndex.value,
          items: controller.classList
              .map((e) => DropdownMenuItem(
                    child: Text(e.name),
                    value: e.id,
                  ))
              .toList(),
          onChanged: (value) => selectedClassIndex(value))),
      Obx(
        () => FormBuilderDropdown(
          attribute: "batchId",
          decoration: InputDecoration(labelText: EntityNames.batchName),
          validators: [FormBuilderValidators.required()],
          items: selectedClassIndex.value != null
              ? controller.classList
                  .firstWhere((c) => c.id == selectedClassIndex.value)
                  .batches
                  ?.map((item) =>
                      DropdownMenuItem(value: item.id, child: Text(item.name)))
                  ?.toList()
              : null,
        ),
      ),
    ],
  );
}
