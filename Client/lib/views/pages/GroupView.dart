import 'package:Client/controllers/GroupViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/Student/GroupModel.dart';
import 'package:Client/models/Student/SubgroupModel.dart';
import 'package:Client/service/DialogService/DialogService.dart';
import 'package:Client/service/api/GroupApi.dart';
import 'package:Client/views/pages/BaseView.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class GroupView extends StatelessWidget {
  final controller = Get.put(GroupViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        isLoading: controller.isLoading.value,
        addForm: _form(value: GroupModel().toJson()),
        updateForm: Obx(
          () => _form(
              isUpdateForm: true, value: controller.selectedItem?.toJson()),
        ),
        listCard: Obx(
          () => BaseListCard(
            isLoading: controller.isFetchingData.value,
            filters: [
              //Class
              DropdownButton(
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
                  onChanged: (value) => controller.selectClass(value)),
              //Batch
              DropdownButton(
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
                  onChanged: (value) => controller.selectBatch(value))
            ],
            columns: [
              DataColumn(label: Text('Name')),
            ],
            rows: List.generate(controller.itemsList.length, (i) {
              var item = controller.itemsList[i];
              return DataRow(
                  onSelectChanged: (_) => controller.selectItem(i),
                  selected: controller.selectedItems[i],
                  cells: [
                    DataCell(Text(item.name)),
                  ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, Map<String, dynamic> value}) {
  var controller = Get.put(GroupViewController());
  final selectedClassIndex = Rx<int>();

  if (isUpdateForm && value != null) {
    selectedClassIndex.value = controller.classList.length > 0
        ? controller.classList
            ?.firstWhere(
                (c) => c.batches.any((b) => b.id == (value["batchId"] as int)))
            ?.id
        : null;
  }

  //list of subgroups
  var subgroups;
  if (isUpdateForm)
    subgroups = controller.updateSubgroups;
  else
    subgroups = controller.addSubgroups;

  if (isUpdateForm && value != null) {
    //map all subgroup's id & name outside of the nested list,
    //so form builder can bind to them and can set initial values
    //(NOTE: form buidler don't support nested initialvalues yet, this is just a workaround for that)
    var values = value["subgroups"] as List;
    if (values != null) {
      int i = 0;
      for (var item in values) {
        value["subgroups.id.$i"] = item["subgroupId"];
        value["subgroups.name.${i++}"] = item["name"];
      }
    }

    //extract the subgroups json list from map and recreate subgroups list for form builder to generate textfields
    if (value["subgroups"] is List) {
      subgroups.value = (value["subgroups"] as List)
          .map((e) => SubgroupModel.fromJson(e))
          .toList();
    }
  }

  return BaseForm<GroupViewController, GroupModel, GroupApi>(
    itemName: EntityNames.groupName,
    isUpdateForm: isUpdateForm,
    initialValue: value,
    // onSubmit: (_, __) {
    //   subgroups.value = [];
    //   value = null;
    // },
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'name',
        decoration: InputDecoration(labelText: "Name"),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(100)
        ],
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
      Obx(
        () => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Values",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  //Add subgroup Button
                  IconButton(
                      color: Get.theme.primaryColor,
                      icon: Icon(Icons.add),
                      onPressed: () => subgroups.add(SubgroupModel()))
                ],
              ),
              //Default Values
              ...List.generate(
                subgroups.length,
                (index) => Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        attribute: "subgroups.name.$index",
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
                          if (subgroups.length < 2) {
                            DialogService.showWarningDialog(
                                message: "Must provide atleast one value.");
                            return;
                          }
                          subgroups.remove(subgroups[index]);
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
