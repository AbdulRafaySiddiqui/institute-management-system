import 'package:Client/models/Guardian/GuardianTypeModel.dart';
import 'package:Client/service/api/GuardianTypeApi.dart';

import 'BaseItemController.dart';

class GuardianTypeViewController
    extends BaseItemController<GuardianTypeModel, GuardianTypeApi> {
  @override
  GuardianTypeModel fromJson(Map<String, dynamic> map) =>
      GuardianTypeModel.fromJson(map);
}
