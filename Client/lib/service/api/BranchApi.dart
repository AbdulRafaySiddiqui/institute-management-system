import 'package:Client/models/Branch/BranchModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class BranchApi extends BaseApi<BranchModel> {
  BranchApi() : super('branches', useFilteredFetchOnly: false);

  @override
  fromJson(Map<String, dynamic> map) => BranchModel.fromJson(map);
}
