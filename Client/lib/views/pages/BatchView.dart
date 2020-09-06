import 'package:Client/Utils/Utils.dart';
import 'package:Client/controllers/BatchViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/BatchModel.dart';
import 'package:Client/service/api/BatchApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BatchView extends StatelessWidget {
  final controller = Get.put(BatchViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: BatchModel().toJson()),
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
            ],
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('End Date')),
              DataColumn(label: Text('Status')),
            ],
            rows: List.generate(controller.itemsList.length, (i) {
              var item = controller.itemsList[i];
              return DataRow(
                onSelectChanged: (_) => controller.selectItem(i),
                selected: controller.selectedItems[i],
                cells: [
                  DataCell(Text(item.name)),
                  DataCell(Text(Utils.formateDateOnly(item.startDate))),
                  DataCell(Text(Utils.formateDateOnly(item.endDate))),
                  DataCell(Chip(
                    backgroundColor:
                        item.isActive ? Colors.green[600] : Colors.red,
                    label: Text(
                      item.isActive ? "Active" : "Closed",
                    ),
                  ))
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  final controller = Get.put(BatchViewController());
  if (isUpdateForm && value != null) {
    value["startDate"] = DateTime.parse(value["startDate"]);
    value["endDate"] = DateTime.parse(value["endDate"]);
  }
  return BaseForm<BatchViewController, BatchModel, BatchApi>(
      inputWidgets: [
        FormBuilderTextField(
          attribute: 'name',
          decoration: InputDecoration(labelText: "Name"),
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(100)
          ],
        ),
        FormBuilderDateTimePicker(
          attribute: "startDate",
          inputType: InputType.date,
          format: DateFormat(Utils.dateFormate),
          validators: [FormBuilderValidators.required()],
          decoration: InputDecoration(labelText: "Start Date"),
        ),
        FormBuilderDateTimePicker(
          attribute: "endDate",
          inputType: InputType.date,
          format: DateFormat(Utils.dateFormate),
          validators: [FormBuilderValidators.required()],
          decoration: InputDecoration(labelText: "End Date"),
        ),
        if (isUpdateForm) ...{
          FormBuilderDropdown(
              attribute: "isActive",
              decoration: InputDecoration(labelText: "Status"),
              validators: [
                FormBuilderValidators.required()
              ],
              items: [
                DropdownMenuItem(value: true, child: Text("Active")),
                DropdownMenuItem(value: false, child: Text("Closed")),
              ]),
        },
        FormBuilderDropdown(
          attribute: "classId",
          decoration: InputDecoration(labelText: EntityNames.className),
          validators: [FormBuilderValidators.required()],
          items: controller.classList
              ?.map((item) =>
                  DropdownMenuItem(value: item.id, child: Text(item.name)))
              ?.toList(),
        ),
      ],
      itemName: EntityNames.batchName,
      isUpdateForm: isUpdateForm,
      initialValue: value);
}
