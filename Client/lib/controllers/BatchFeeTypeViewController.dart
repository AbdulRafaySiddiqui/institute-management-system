import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/Batch/BatchModel.dart';
import 'package:Client/models/Class/ClassModel.dart';
import 'package:Client/models/Fee/BatchFeeTypeModel.dart';
import 'package:Client/models/Fee/FeeTypeModel.dart';
import 'package:Client/service/DialogService/DialogService.dart';
import 'package:Client/service/api/BatchFeeType.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/service/api/FeeTypeApi.dart';
import 'package:get/get.dart';

class BatchFeeTypeViewController
    extends BaseItemController<BatchFeeTypeModel, BatchFeeTypeApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchClasses();
    await fetchFeeTypes();
    if (classList.length > 0) {
      selectClass(classList[0]);

      if (selectedClass.value.batches != null &&
          selectedClass.value.batches.length > 0) {
        selectBatch(selectedClass.value.batches[0], notify: false);
      }
    }

    isLoading.value = false;
  }

  @override
  BatchFeeTypeModel fromJson(Map<String, dynamic> map) =>
      BatchFeeTypeModel.fromJson(map);

  @override
  List<BatchFeeTypeModel> get itemsList => (super.itemsList == null ||
          super.itemsList.length < 1 ||
          selectedBatch.value == null)
      ? []
      : super
          .itemsList
          .where((e) => e.batchId == selectedBatch.value?.id)
          .toList();

  final _classApi = locator<ClassApi>();
  final _feeTypeApi = locator<FeeTypeApi>();
  final classList = <ClassModel>[].obs;
  final feeTypeList = <FeeTypeModel>[].obs;
  final selectedClass = ClassModel().obs;
  final selectedBatch = BatchModel().obs;

  selectClass(ClassModel model) {
    selectedIndex.value = -1;
    selectedClass(model);
    selectedBatch.value = null;
  }

  selectBatch(BatchModel model, {bool notify = true}) async {
    selectedIndex.value = -1;
    selectedBatch(model);
    await fetchAllItems(id: model.id, notify: notify);
  }

  Future<void> fetchClasses() async {
    var response = await _classApi.fetchAll(id: currentBranchId);
    if (response is String) {
      DialogService.showErrorDialog(message: response);
    } else {
      classList.value = response;
    }
  }

  Future<void> fetchFeeTypes() async {
    var response = await _feeTypeApi.fetchAll(id: currentBranchId);
    if (response is String) {
      DialogService.showErrorDialog(message: response);
    } else {
      feeTypeList.value = response;
    }
  }
}
