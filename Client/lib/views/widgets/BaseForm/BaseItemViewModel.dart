import 'package:Client/models/BaseModel.dart';
import 'package:flutter/material.dart';

abstract class BaseItemViewModel<T extends BaseModel> with ChangeNotifier {
  Function add;
  Function update;
  Function delete;
  Function fetch;

  T selectedItem;
  List<T> itemsList = [];
  List<bool> selectedItems;
  bool isAdding = false;
  bool isUpdating = false;
  bool isDeleting = false;
  bool isFetchingData = false;
  String error;

  T fromJson(Map<String, dynamic> map);

  void selectItem(int index) {
    if (isAdding || isUpdating || isDeleting) return;

    selectedItem = itemsList[index];
    selectedItems = List<bool>.generate(itemsList.length, (i) => index == i);
    notifyListeners();
  }

  Future<void> fetchAllItems() async {
    isFetchingData = true;
    notifyListeners();

    var response = await fetch();
    if (response is String)
      error = response;
    else {
      itemsList = response;
      selectedItems = List<bool>.generate(itemsList.length, (i) => false);
    }

    isFetchingData = false;
    notifyListeners();
  }

  Future<void> addItem(Map<String, dynamic> map) async {
    if (map == null) {
      print('BRanch is NULL');
      return;
    }
    isAdding = true;
    notifyListeners();
    var value = fromJson(map);
    var response = await add(value);
    if (response is String)
      error = response;
    else {
      itemsList.add(response);
      selectedItems.add(false);
    }

    isAdding = false;
    notifyListeners();
  }

  Future<void> updateItem(Map<String, dynamic> map) async {
    isUpdating = true;
    notifyListeners();
    var value = fromJson(map);
    var response = await update(value);
    if (response is String)
      error = response;
    else {
      //this updates the value in list
      selectedItem = response;
      selectedItems.add(false);
    }

    isUpdating = false;
    notifyListeners();
  }

  Future<void> deleteItem() async {
    var response = await delete(selectedItem.id);
    if (response is String) {
      error = response;
    } else {
      itemsList.remove(selectedItem);
      selectedItem = null;
    }
    notifyListeners();
  }
}
