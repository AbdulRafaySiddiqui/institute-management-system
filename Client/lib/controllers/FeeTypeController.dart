import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Fee/FeeTypeModel.dart';
import 'package:Client/service/api/FeeTypeApi.dart';

class FeeTypeViewController
    extends BaseItemController<FeeTypeModel, FeeTypeApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchAllItems(id: currentBranchId);

    isLoading.value = false;
  }

  @override
  FeeTypeModel fromJson(Map<String, dynamic> map) => FeeTypeModel.fromJson(map);
}
