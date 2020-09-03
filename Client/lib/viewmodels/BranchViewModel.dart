import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/views/widgets/Base/BaseItemViewModel.dart';

class BranchViewModel extends BaseItemViewModel<BranchModel, BranchApi> {
  @override
  BranchModel fromJson(Map<String, dynamic> map) {
    return BranchModel.fromJson(map);
  }
}
