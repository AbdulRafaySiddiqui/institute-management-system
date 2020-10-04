import 'package:Client/controllers/StudentListViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/export.dart';
import 'package:Client/routing/Routes.dart';
import 'package:Client/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentListView extends StatelessWidget {
  final controller = Get.put(StudentListViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Main Header
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${EntityNames.studentName}s List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          //Class
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              hint: Text(EntityNames.className),
                              value: controller.selectedClass.value,
                              items: controller.classList
                                  ?.map((e) => DropdownMenuItem(
                                        child: Text(e.name),
                                        value: e,
                                      ))
                                  ?.toList(),
                              onChanged: (value) {
                                controller.selectedClass.value = value;
                              },
                            ),
                          ),
                          //Batch
                          if (controller.selectedClass.value != null)
                            Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButton(
                                  hint: Text(EntityNames.batchName),
                                  value: controller.selectedBatch.value,
                                  items: controller.selectedClass.value?.batches
                                      ?.map((e) => DropdownMenuItem(
                                          child: Text(e.name), value: e))
                                      ?.toList(),
                                  onChanged: (batch) =>
                                      controller.selectedBatch.value = batch,
                                ),
                              ),
                            ),
                          //Group
                          Obx(() => Wrap(children: [
                                ...List<Widget>.generate(
                                  controller.selectedBatch.value.groups.length,
                                  (index) => Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Obx(
                                      () => DropdownButton(
                                        hint: Text(controller.selectedBatch
                                            .value.groups[index].name),
                                        value: controller.selectedBatch.value
                                            .groups[index].selectedSubgroup,
                                        items: controller.selectedBatch.value
                                            .groups[index].subgroups
                                            ?.map((e) {
                                          return DropdownMenuItem(
                                            child: Text(e.name),
                                            value: e,
                                          );
                                        })?.toList(),
                                        onChanged: (value) => controller
                                            .selectSubgroup(index, value),
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                        ],
                      ),
                      SizedBox(height: 20),
                      _studentList()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _studentList() {
    return DataTable(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      showCheckboxColumn: false,
      columns: [
        DataColumn(label: Text("Action")),
        DataColumn(label: Text("S.No.")),
        ...controller.fieldList
            .map((e) => DataColumn(label: Text(e.name)))
            .toList(),
      ],
      rows: List<DataRow>.generate(controller.itemsList.length, (index) {
        var e = controller.itemsList[index];
        return DataRow(
            color: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              // All rows will have the same selected color.
              if (states.contains(MaterialState.selected)) return Colors.grey;
              // Even rows will have a grey color.
              if (index % 2 == 0) return Colors.grey.withOpacity(0.1);
              return null; // Use default value for other states and odd rows.
            }),
            onSelectChanged: (_) => controller.selectItem(index),
            selected: controller.selectedItems[index],
            cells: [
              DataCell(IconButton(
                icon: Icon(Icons.details),
                onPressed: () {
                  Get.reset();
                  Get.toNamed(Routes.studentFormRoute, arguments: e.id);
                },
              )),
              DataCell(Text((index + 1).toString())),
              ...List<DataCell>.generate(controller.fieldList.length, (i) {
                String value = controller.fieldList.length - 1 > i
                    ? e.studentFields
                        .firstWhere((element) =>
                            element.fieldId == controller.fieldList[i].id)
                        ?.value
                    : "";
                var inputMethod = controller.fieldList[i].inputMethod;
                var transformedValue = value;
                switch (inputMethod) {
                  case InputMethod.DatePicker:
                    var date = DateTime.tryParse(value);
                    if (date != null)
                      transformedValue = Utils.formateDateOnly(date);
                    break;
                  case InputMethod.TimePicker:
                    var time = DateTime.tryParse(value);
                    if (time != null)
                      transformedValue = Utils.formateTimeOnly(time);
                    break;
                  default:
                }
                return DataCell(
                  Text(transformedValue),
                );
              }),
            ]);
      }).toList(),
    );
  }
}
