import 'package:Client/models/Fee/BatchFeeTypeModel.dart';
import 'package:Client/service/api/BaseApi.dart';

//filter = batchid
class BatchFeeTypeApi extends BaseApi<BatchFeeTypeModel> {
  BatchFeeTypeApi() : super('batchfeetypes');

  @override
  fromJson(Map<String, dynamic> map) => BatchFeeTypeModel.fromJson(map);
}
