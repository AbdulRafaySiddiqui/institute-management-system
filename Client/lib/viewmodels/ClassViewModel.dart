import 'package:Client/locator/locator.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/views/widgets/Base/BaseItemViewModel.dart';

class ClassViewModel extends BaseItemViewModel<ClassModel, ClassApi> {
  ClassViewModel() {
    _branchApi = locator<BranchApi>();
  }
  @override
  ClassModel fromJson(Map<String, dynamic> map) {
    return ClassModel.fromJson(map);
  }

  BranchApi _branchApi;
  List<BranchModel> branchList;

  Future<void> fetchBranches() async {
    branchList = await _branchApi.fetchAll();
  }
}
