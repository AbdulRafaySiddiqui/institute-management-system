import 'package:Client/models/Field/FieldModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class FieldApi extends BaseApi<FieldModel> {
  FieldApi() : super('fields', useFilteredFetchOnly: false);

  @override
  fromJson(Map<String, dynamic> map) => FieldModel.fromJson(map);
}
