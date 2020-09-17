import 'package:Client/locator/locator.dart';
import 'package:Client/models/Student/StudentIdTypeModel.dart';
import 'package:Client/service/api/StudentIdTypeApi.dart';

import 'BaseItemController.dart';

class StudentIdTypeViewController
    extends BaseItemController<StudentIdTypeModel, StudentIdTypeApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchAllItems(id: currentBranchId);

    isLoading.value = false;
  }

  @override
  StudentIdTypeModel fromJson(Map<String, dynamic> map) =>
      StudentIdTypeModel.fromJson(map);
}
