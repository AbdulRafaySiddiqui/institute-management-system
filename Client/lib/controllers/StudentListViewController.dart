import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/export.dart';
import 'package:Client/service/export.dart';
import 'package:get/get.dart';

class StudentListViewController
    extends BaseItemController<StudentModel, StudentApi> {
  @override
  StudentModel fromJson(Map<String, dynamic> map) => StudentModel.fromJson(map);

  @override
  void onInit() async {
    isLoading.value = true;

    //fetch classes
    classList.value = await _classApi.fetchAll(id: currentBranchId);

    //add the ALL option for groups
    classList.forEach(
      (c) => c.batches?.forEach((b) => b.groups
          ?.forEach((g) => g.subgroups.insert(0, SubgroupModel(name: "All")))),
    );

    if (classList.isNotEmpty) {
      //set class
      selectedClass.value = classList.first;
      if (selectedClass.value.batches.isNotEmpty) {
        //set batch
        selectedBatch.value = selectedClass.value.batches.first;
        if (selectedBatch.value.groups.isNotEmpty) {
          //set groups
          for (var i = 0; i < selectedBatch.value.groups.length; i++) {
            //not need to check for empty list cause we already added ALL option for all groups
            // if (selectedBatch.value.groups[i].subgroups.isNotEmpty)
            selectSubgroup(i, selectedBatch.value.groups[i].subgroups.first);
          }
        }
      }
    }

    List<FieldModel> fields = await _fieldApi.fetchAll();
    fieldList.value =
        fields.where((e) => e.personType == PersonType.Student).toList();

    fieldList.sort();

    await fetchAllItems(id: selectedBatch.value.id, notify: false);

    isLoading.value = false;
  }

  @override
  List<StudentModel> get itemsList => super
      .itemsList
      .where((e) => selectedBatch.value.groups.every((j) =>
          //if id is null than its the ALL option
          j.selectedSubgroup.id == null ||
          //else if the check if student belong to this subgroup
          e.studentSubgroups.any((i) => i.subgroupId == j.selectedSubgroup.id)))
      .toList();

  final _classApi = locator<ClassApi>();
  final _fieldApi = locator<FieldApi>();

  final classList = <ClassModel>[].obs;
  final fieldList = <FieldModel>[].obs;
  final selectedClass = ClassModel().obs;
  final selectedBatch = BatchModel().obs;

  selectClass(value) => selectedClass.value = value;
  selectBatch(value) async {
    selectedBatch.value = value;
    await fetchAllItems(id: selectedBatch.value.id);
  }

  selectSubgroup(groupIndex, subgroup) {
    selectedBatch.update(
        (value) => value.groups[groupIndex].selectedSubgroup = subgroup);
  }
}
