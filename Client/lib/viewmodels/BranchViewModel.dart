import 'package:Client/locator/locator.dart';
import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/views/widgets/BaseForm/BaseItemViewModel.dart';

class BranchViewModel extends BaseItemViewModel<BranchModel> {
  BranchViewModel() {
    api = locator<BranchApi>();
    super.add = api.add;
    super.update = api.update;
    super.delete = api.delete;
    super.fetch = api.fetchAll;
    fetchAllItems();
  }

  var api;

  @override
  BranchModel fromJson(Map<String, dynamic> map) {
    return BranchModel.fromJson(map);
  }
}
