import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:get/get.dart';

class ClassViewController extends BaseItemController<ClassModel, ClassApi> {
  @override
  void onInit() async {
    isLoading.value = false;

    await fetchBranches();
    if (branchList != null) {
      selectBranch(branchList[0], notify: false);
    }

    isLoading.value = false;
  }

  @override
  ClassModel fromJson(Map<String, dynamic> map) => ClassModel.fromJson(map);

  @override
  List<ClassModel> get itemsList => super.itemsList;
  // selectedBranch.value == null
  //     ? super.itemsList
  //     : super
  //         .itemsList
  //         .where((e) => e.branchId == selectedBranch.value.id)
  //         .toList();

  BranchApi _branchApi = locator<BranchApi>();
  final branchList = <BranchModel>[].obs;
  final selectedBranch = BranchModel().obs;

  selectBranch(BranchModel model, {bool notify = true}) async {
    selectedItem.value = null;
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
