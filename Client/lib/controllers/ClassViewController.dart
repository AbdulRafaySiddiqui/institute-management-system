import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Branch/BranchModel.dart';
import 'package:Client/models/Class/ClassModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:get/get.dart';

class ClassViewController extends BaseItemController<ClassModel, ClassApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchBranches();
    if (branchList.length > 0) {
      selectBranch(branchList[0], notify: false);
    }

    isLoading.value = false;
  }

  @override
  ClassModel fromJson(Map<String, dynamic> map) => ClassModel.fromJson(map);

  @override
  List<ClassModel> get itemsList => selectedBranch.value == null
      ? super.itemsList
      : super
          .itemsList
          .where((e) => e.branchId == selectedBranch.value.id)
          .toList();

  BranchApi _branchApi = locator<BranchApi>();
  final branchList = <BranchModel>[].obs;
  final selectedBranch = BranchModel().obs;

  selectBranch(BranchModel model, {bool notify = true}) async {
    selectedIndex.value = -1;
    selectedBranch(model);
    await fetchAllItems(id: model.id, notify: notify);
  }

  Future<void> fetchBranches() async {
    var response = await _branchApi.fetchAll();
    if (response is String) {
    } else {
      branchList.value = response;
    }
  }
}
