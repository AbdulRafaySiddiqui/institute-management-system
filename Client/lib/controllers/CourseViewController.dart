import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/models/CourseModel.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/service/api/CourseApi.dart';
import 'package:get/get.dart';

class CourseViewController extends BaseItemController<CourseModel, CourseApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    await fetchClasses();
    if (classList.length > 0) {
      selectClass(classList[0], notify: false);
    }

    isLoading.value = false;
  }

  @override
  CourseModel fromJson(Map<String, dynamic> map) => CourseModel.fromJson(map);

  @override
  List<CourseModel> get itemsList => selectedClass.value == null
      ? super.itemsList
      : super
          .itemsList
          .where((e) => e.classId == selectedClass.value.id)
          .toList();

  final _classApi = locator<ClassApi>();
  final classList = <ClassModel>[].obs;
  final selectedClass = ClassModel().obs;

  selectClass(ClassModel model, {bool notify = true}) async {
    selectedIndex.value = -1;
    selectedClass(model);
    await fetchAllItems(id: model.id, notify: notify);
  }

  Future<void> fetchClasses() async {
    var response = await _classApi.fetchAll(id: currentBranchId);
    if (response is String) {
    } else {
      classList.value = response;
    }
  }
}
