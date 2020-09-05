import 'package:Client/locator/locator.dart';
import 'package:Client/models/BaseModel.dart';
import 'package:Client/service/api/BaseApi.dart';
import 'package:get/get.dart';

abstract class BaseItemController<T extends BaseModel, TApi extends BaseApi<T>>
    extends GetxController {
  @override
  void onInit() async {
    isLoading.value = false;

    await fetchAllItems(notify: false);

    isLoading.value = false;
  }

  TApi api = locator<TApi>();

  final isLoading = false.obs;
  final selectedIndex = (-1).obs;
  final selectedItem = Rx<T>();
  List<bool> get selectedItems =>
      List<bool>.generate(_itemsList.length, (i) => selectedIndex.value == i);
  final _itemsList = <T>[].obs;
  List<T> get itemsList => [..._itemsList];
  final isAdding = false.obs;
  final isUpdating = false.obs;
  final isDeleting = false.obs;
  final isFetchingData = false.obs;

  T fromJson(Map<String, dynamic> map);

  void selectItem(int index) {
    if (isAdding.value || isUpdating.value || isDeleting.value) return;

    selectedIndex.value = index;
    selectedItem.value = _itemsList[index];
  }

  Future<void> fetchAllItems({int id, bool notify = true}) async {
    if (notify) {
      isFetchingData.value = true;
    }

    var response = await api.fetchAll(id: id);
    if (response is String)
      Get.defaultDialog();
    else {
      _itemsList.value = response;
    }

    if (notify) {
      isFetchingData.value = false;
    }
  }

  Future<void> addItem(Map<String, dynamic> map) async {
    isAdding.value = true;

    var value = fromJson(map);
    var response = await api.add(value);
    if (response is String)
      Get.defaultDialog();
    else {
      _itemsList.add(response);
      selectedItems.add(false);
    }

    isAdding.value = false;
  }

  Future<void> updateItem(Map<String, dynamic> map) async {
    selectedItem(fromJson(map));

    isUpdating.value = true;

    var value = fromJson(map);
    var response = await api.update(value);
    if (response is String)
      Get.defaultDialog();
    else {
      selectedItem(response);
      _itemsList[selectedIndex.value] = response;
      selectedItems.add(false);
    }

    isUpdating.value = false;
  }

  Future<void> deleteItem() async {
    isDeleting.value = true;

    var response = await api.delete(selectedItem.value.id);
    if (response is String) {
      Get.defaultDialog();
    } else {
      _itemsList.remove(selectedItem.value);
      selectedItem.value = null;
      selectedIndex(-1);
    }

    isDeleting.value = false;
  }
}
