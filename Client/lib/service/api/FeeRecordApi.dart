import 'package:Client/models/Fee/FeeRecordModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class FeeRecordApi extends BaseApi<FeeRecordModel> {
  FeeRecordApi() : super('feeRecords');

  @override
  fromJson(Map<String, dynamic> map) => FeeRecordModel.fromJson(map);
}
