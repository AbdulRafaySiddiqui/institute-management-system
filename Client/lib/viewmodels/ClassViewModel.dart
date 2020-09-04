import 'package:Client/locator/locator.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/views/widgets/Base/BaseItemViewModel.dart';

class ClassViewModel extends BaseItemViewModel<ClassModel, ClassApi> {
  @override
  void init() async {
    _branchApi = locator<BranchApi>();
    await fetchBranches();
    if (branchList != null) {
      selectBranch(branchList[0]);
    }
    isLoading = false;
    notifyListeners();
  }

  @override
  ClassModel fromJson(Map<String, dynamic> map) => ClassModel.fromJson(map);

  @override
  List<ClassModel> get itemsList => selectedBranch == null
      ? super.itemsList
      : super.itemsList.where((e) => e.branchId == selectedBranch.id).toList();

  BranchApi _branchApi;
  List<BranchModel> branchList;
  BranchModel selectedBranch;

  selectBranch(BranchModel model) async {
    selectedBranch = model;
    fetchAllItems(id: model.id);
    notifyListeners();
  }

  Future<void> fetchBranches() async {
    var response = await _branchApi.fetchAll();
    if (response is String) {
    } else {
      branchList = response;
    }
    notifyListeners();
  }
}
