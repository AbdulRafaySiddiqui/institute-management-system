import 'package:Client/locator/locator.dart';
import 'package:Client/models/BaseModel.dart';
import 'package:Client/service/api/BaseApi.dart';
import 'package:flutter/material.dart';

abstract class BaseItemViewModel<T extends BaseModel, TApi extends BaseApi<T>>
    with ChangeNotifier {
  BaseItemViewModel() {
    api = locator<TApi>();
    init();
  }

  void init() {
    fetchAllItems();

    isLoading = false;
    notifyListeners();
  }

  TApi api;

  bool isLoading = true;
  int selectedIndex;
  T selectedItem;
  List<T> _itemsList = [];
  List<T> get itemsList => [..._itemsList];
  List<bool> selectedItems;
  bool isAdding = false;
  bool isUpdating = false;
  bool isDeleting = false;
  bool isFetchingData = false;
  String error;

  T fromJson(Map<String, dynamic> map);

  void selectItem(int index) {
    if (isAdding || isUpdating || isDeleting) return;

    selectedIndex = index;
    selectedItem = _itemsList[index];
    selectedItems = List<bool>.generate(_itemsList.length, (i) => index == i);
    notifyListeners();
  }

  Future<void> fetchAllItems({int id}) async {
    isFetchingData = true;
    notifyListeners();

    var response = await api.fetchAll(id: id);
    if (response is String)
      error = response;
    else {
      _itemsList = response;
      selectedItems = List<bool>.generate(_itemsList.length, (i) => false);
    }

    isFetchingData = false;
    notifyListeners();
  }

  Future<void> addItem(Map<String, dynamic> map) async {
    isAdding = true;
    notifyListeners();

    var value = fromJson(map);
    var response = await api.add(value);
    if (response is String)
      error = response;
    else {
      _itemsList.add(response);
      selectedItems.add(false);
    }

    isAdding = false;
    notifyListeners();
  }

  Future<void> updateItem(Map<String, dynamic> map) async {
    selectedItem = fromJson(map);

    isUpdating = true;
    notifyListeners();
    var value = fromJson(map);
    var response = await api.update(value);
    if (response is String)
      error = response;
    else {
      selectedItem = response;
      _itemsList[selectedIndex] = response;
      selectedItems.add(false);
    }

    isUpdating = false;
    notifyListeners();
  }

  Future<void> deleteItem() async {
    isDeleting = true;
    notifyListeners();

    var response = await api.delete(selectedItem.id);
    if (response is String) {
      error = response;
    } else {
      _itemsList.remove(selectedItem);
      selectedItem = null;
    }

    isDeleting = false;
    notifyListeners();
  }
}
