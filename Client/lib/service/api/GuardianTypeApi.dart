import 'package:Client/models/Guardian/GuardianTypeModel.dart';
import 'package:Client/service/api/BaseApi.dart';

class GuardianTypeApi extends BaseApi<GuardianTypeModel> {
  GuardianTypeApi() : super('guardianTypes', useFilteredFetchOnly: false);

  @override
  fromJson(Map<String, dynamic> map) => GuardianTypeModel.fromJson(map);
}
