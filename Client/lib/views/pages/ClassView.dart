import 'package:Client/controllers/ClassViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ClassView extends StatelessWidget {
  final controller = Get.put(ClassViewController());
  @override
  Widget build(BuildContext context) {
    return BaseView(
      isLoading: controller.isLoading.value,
      addForm: _form(value: ClassModel().toJson()),
      updateForm: Obx(
        () => _form(
            isUpdateForm: true, value: controller.selectedItem.value?.toJson()),
      ),
      listCard: Obx(
        () => BaseListCard(
          isLoading: controller.isFetchingData.value,
          filters: [
            Obx(() {
              return DropdownButton(
                  hint: Text(EntityNames.branchName),
                  value: controller.selectedBranch.value,
                  items: controller.branchList
                      ?.map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ),
                      )
                      ?.toList(),
                  onChanged: (value) => controller.selectBranch(value));
            }),
          ],
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

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  final controller = Get.put(ClassViewController());
  return BaseForm<ClassViewController, ClassModel, ClassApi>(
      inputWidgets: [
        FormBuilderTextField(
          attribute: 'name',
          decoration: InputDecoration(labelText: "Name"),
          validators: [FormBuilderValidators.required()],
        ),
        Obx(
          () => FormBuilderDropdown(
            attribute: "branchId",
            decoration: InputDecoration(labelText: EntityNames.branchName),
            validators: [FormBuilderValidators.required()],
            items: controller.branchList
                ?.map((item) =>
                    DropdownMenuItem(value: item.id, child: Text(item.name)))
                ?.toList(),
          ),
        ),
      ],
      itemName: EntityNames.className,
      isUpdateForm: isUpdateForm,
      initialValue: value);
}
