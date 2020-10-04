import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Batch/BatchModel.dart';
import 'package:Client/models/Class/ClassModel.dart';
import 'package:Client/models/Student/GroupModel.dart';
import 'package:Client/models/Student/SubgroupModel.dart';
import 'package:Client/service/DialogService/DialogService.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/service/api/GroupApi.dart';
import 'package:get/get.dart';

class GroupViewController extends BaseItemController<GroupModel, GroupApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchClasses();
    if (classList.length > 0) {
      selectClass(classList[0]);

      if (selectedClass.value.batches != null &&
          selectedClass.value.batches.length > 0) {
        selectBatch(selectedClass.value.batches[0], notify: false);
      }
    }

    isLoading.value = false;
  }

  @override
  GroupModel fromJson(Map<String, dynamic> map) => GroupModel.fromJson(map);

  final _classApi = locator<ClassApi>();
  final classList = <ClassModel>[].obs;
  final selectedClass = ClassModel().obs;
  final selectedBatch = BatchModel().obs;

  @override
  List<GroupModel> get itemsList => super
      .itemsList
      .where((e) => e.batchId == selectedBatch.value?.id)
      .toList();

  selectClass(ClassModel model) {
    selectedIndex.value = -1;
    selectedClass(model);
    selectedBatch.value = null;
  }

  selectBatch(BatchModel model, {bool notify = true}) async {
    selectedIndex.value = -1;
    selectedBatch(model);
    await fetchAllItems(id: model.id, notify: notify);
  }

  Future<void> fetchClasses() async {
    var response = await _classApi.fetchAll(id: currentBranchId);
    if (response is String) {
      DialogService.showErrorDialog(message: response);
    } else {
      classList.value = response;
    }
  }

  final addSubgroups = <SubgroupModel>[SubgroupModel()].obs;
  final updateSubgroups = <SubgroupModel>[SubgroupModel()].obs;

  Map<String, dynamic> extractSubgroups(
      Map<String, dynamic> map, bool isUpdate) {
    var item = GroupModel.fromJson(map);
    List<SubgroupModel> subgroupList = [];
    int length =
        isUpdate == false ? addSubgroups.length : updateSubgroups.length;
    for (var i = 0; i < length; i++) {
      var id = "subgroups.id.$i";
      var value = "subgroups.name.$i";
      if (map.containsKey(value)) {
        var subgroup = SubgroupModel();
        subgroup.name = map[value];
        if (map.containsKey(id)) {
          subgroup.id = map[id];
        }
        subgroupList.add(subgroup);
      }
    }
    item.subgroups = subgroupList;
    return item.toJson();
  }

  @override
  Future<void> addItem(Map<String, dynamic> map) {
    var value = extractSubgroups(map, false);
    return super.addItem(value);
  }

  @override
  Future<void> updateItem(Map<String, dynamic> map) {
    var value = extractSubgroups(map, true);
    return super.updateItem(value);
  }
}
