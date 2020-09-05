import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BranchApi.dart';

class BranchViewController extends BaseItemController<BranchModel, BranchApi> {
  @override
  BranchModel fromJson(Map<String, dynamic> map) {
    return BranchModel.fromJson(map);
  }
}
