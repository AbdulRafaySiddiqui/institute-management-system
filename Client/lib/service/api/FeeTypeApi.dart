import 'package:Client/models/Fee/FeeTypeModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class FeeTypeApi extends BaseApi<FeeTypeModel> {
  FeeTypeApi() : super('feetypes');

  @override
  fromJson(Map<String, dynamic> map) => FeeTypeModel.fromJson(map);
}
