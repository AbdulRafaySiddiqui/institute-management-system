import 'package:Client/controllers/CourseViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/CourseModel.dart';
import 'package:Client/service/api/CourseApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CourseView extends StatelessWidget {
  final controller = Get.put(CourseViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: CourseModel().toJson()),
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
              DataColumn(label: Text('Short Name')),
            ],
            rows: List.generate(
              controller.itemsList.length,
              (i) => DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(controller.itemsList[i].name)),
                    DataCell(Text(controller.itemsList[i].shortName)),
                  ]),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  final controller = Get.put(CourseViewController());
  return BaseForm<CourseViewController, CourseModel, CourseApi>(
      inputWidgets: [
        FormBuilderTextField(
          attribute: 'name',
          decoration: InputDecoration(labelText: "Name"),
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(100)
          ],
        ),
        FormBuilderTextField(
          attribute: 'shortName',
          decoration: InputDecoration(labelText: "Short Name"),
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(50)
          ],
        ),
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
      itemName: EntityNames.courseName,
      isUpdateForm: isUpdateForm,
      initialValue: value);
}
