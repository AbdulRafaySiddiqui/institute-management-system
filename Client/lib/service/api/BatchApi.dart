import 'package:Client/models/BatchModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class BatchApi extends BaseApi<BatchModel> {
  BatchApi() : super('batches');

  @override
  fromJson(Map<String, dynamic> map) => BatchModel.fromJson(map);
}
