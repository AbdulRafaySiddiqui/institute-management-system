import 'package:Client/controllers/BranchViewController.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class BranchView extends StatelessWidget {
  final controller = Get.put(BranchViewController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isLoading: controller.isLoading.value,
      addForm: _form(value: BranchModel().toJson()),
      updateForm: Obx(
        () => _form(
            isUpdateForm: true, value: controller.selectedItem.value?.toJson()),
      ),
      listCard: Obx(
        () => BaseListCard(
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
    );
  }
}

_form({var isUpdateForm = false, Map<String, dynamic> value}) {
  return BaseForm<BranchViewController, BranchModel, BranchApi>(inputWidgets: [
    FormBuilderTextField(
      attribute: 'name',
      decoration: InputDecoration(labelText: "Name"),
      validators: [FormBuilderValidators.required()],
    ),
  ], itemName: "Branch", isUpdateForm: isUpdateForm, initialValue: value);
}
