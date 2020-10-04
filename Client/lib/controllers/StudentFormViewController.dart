import 'package:Client/locator/locator.dart';
import 'package:Client/models/export.dart';
import 'package:Client/service/export.dart';
import 'package:Client/utils/Utils.dart';
import "package:get/get.dart";

import 'BaseItemController.dart';

class StudentFormViewController
    extends BaseItemController<StudentModel, StudentApi> {
  @override
  void onInit() async {
    isLoading.value = true;

    isUpdateForm = Get.arguments != null;

    if (isUpdateForm) {
      addGuardian();
      addGuardian();
    }

    //to load the batch fee, everytime when batch fee changes
    selectedBatch.listen((value) async {
      batchFeeList.value = await _batchFeeApi.fetchAll(id: value.id);
    });

    fields.value = await _fieldApi.fetchAll();
    idTypeList.value = await _idApi.fetchAll(id: currentBranchId);
    classList.value = await _classApi.fetchAll(id: currentBranchId);
    guardianTypeList.value = await _guardianTypeApi.fetchAll();

    if (isUpdateForm) {
      studentModel.value = await api.getById(Get.arguments as int);
    }

    initializeValues();

    isLoading.value = false;
  }

  initializeValues() {
    //set initial values
    if (idTypeList.isNotEmpty)
      initialValues["studentIdTypeId"] = idTypeList.first.id;

    if (classList.isNotEmpty) {
      //set class
      initialValues["class"] = classList.first;
      selectedClass.value = classList.first;
      if (classList.first.batches.isNotEmpty) {
        //set batch
        initialValues["batch"] = classList.first.batches.first;
        selectedBatch.value = classList.first.batches.first;
        if (classList.first.batches.first.groups.isNotEmpty) {
          //set groups
          for (var i = 0;
              i < classList.first.batches.first.groups.length;
              i++) {
            var group = classList.first.batches.first.groups[i];
            if (group.subgroups.isNotEmpty)
              initialValues["subgroup_$i"] = group.subgroups.first.id;
          }
        }
      }
    }

    //set guardian type
    if (guardianTypeList.isNotEmpty) {
      initialGuardianTypeId.value = guardianTypeList.first.id;
    }
  }

  bool isUpdateForm;
  final initialValues = Map<String, dynamic>().obs;

  final _fieldApi = locator<FieldApi>();
  final _idApi = locator<StudentIdTypeApi>();
  final _classApi = locator<ClassApi>();
  final _batchFeeApi = locator<BatchFeeTypeApi>();
  final _guardianTypeApi = locator<GuardianTypeApi>();

  final studentModel = StudentModel().obs;
  final fields = <FieldModel>[].obs;

  List<FieldModel> get studentFieldList {
    var list = fields.where((e) => e.personType == PersonType.Student).toList();
    list.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return list;
  }

  List<FieldModel> get guardianFieldList {
    var list =
        fields.where((e) => e.personType == PersonType.Guardian).toList();
    list.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return list;
  }

  final classList = <ClassModel>[].obs;
  final selectedClass = ClassModel().obs;
  final selectedBatch = BatchModel().obs;
  final idTypeList = <StudentIdTypeModel>[].obs;
  final batchFeeList = <BatchFeeTypeModel>[].obs;
  final guardianTypeList = <GuardianTypeModel>[].obs;
  final initialGuardianTypeId = Rx<int>();

  @override
  StudentModel fromJson(Map<String, dynamic> map) => StudentModel.fromJson(map);

  addStudentPhone() =>
      studentModel.update((value) => value.phones.add(PhoneModel()));

  removeStudentPhone() => studentModel.update((value) {
        if (value.phones.length > 0) value.phones.removeLast();
      });

  addGuardianPhone(int index) => studentModel.update((value) =>
      value.studentGuardians[index].guardian.phones.add(PhoneModel()));

  removeGurdianPhone(int index) {
    if (studentModel.value.studentGuardians[index].guardian.phones.length > 0)
      studentModel.update((value) =>
          value.studentGuardians[index].guardian.phones.removeLast());
  }

  addGuardian() => studentModel.update((value) {
        value.studentGuardians.add(StudentGuardianModel());
      });

  removeGuardian() {
    if (studentModel.value.studentGuardians.length > 0)
      studentModel.update((value) {
        value.studentGuardians.removeLast();
      });
  }

  @override
  Future<void> addItem(Map<String, dynamic> map) async {
    try {
      //assign student information
      for (var i = 0; i < studentFieldList.length; i++) {
        var student = studentModel.value;

        student.studentFields.add(StudentFieldModel(
            fieldId: studentFieldList[i].id,
            value: map["student_${studentFieldList[i].name}"].toString()));
        //phone info
        for (var j = 0; j < student.phones.length; j++) {
          student.phones[j].number = map["student_phone_$j"];
          student.phones[j].isSmsEnabled = map["student_phone_isSmsEnable_$j"];
        }
      }

      //assign guardian information
      for (var j = 0; j < studentModel.value.studentGuardians.length; j++) {
        var guardian = studentModel.value.studentGuardians[j].guardian;
        for (var i = 0; i < guardianFieldList.length; i++) {
          guardian.guardianTypeId = map["guardian_${i}_guardianTypeId"];
          guardian.guardianFields.add(GuardianFieldModel(
              fieldId: guardianFieldList[i].id,
              value: map["guardian_${i}_${guardianFieldList[i].name}"]));
        }
        //phone info
        for (var i = 0; i < guardian.phones.length; i++) {
          guardian.phones[i].number = map["guardian_${j}_phone_$i"];
          guardian.phones[i].isSmsEnabled =
              map["guardian_${j}_phone_isSmsEnable_$i"];
        }
      }

      //assign fee discounts
      for (var i = 0; i < batchFeeList.length; i++) {
        if (map["fee_${batchFeeList[i].id}"] != null &&
            map["fee_${batchFeeList[i].id}"] != "0" &&
            map["fee_${batchFeeList[i].id}"] != "")
          studentModel.value.discounts.add(DiscountModel(
              feeTypeId: batchFeeList[i].feeTypeId,
              amount: Utils.toInt(map["fee_${batchFeeList[i].id}"])));
      }

      //assign batch
      studentModel.value.studentBatches
          .add(StudentBatchModel(batchId: selectedBatch.value.id));

      //assign subgroups
      for (var i = 0; i < selectedBatch.value.groups.length; i++) {
        studentModel.value.studentSubgroups
            .add(StudentSubgroupModel(subgroupId: map["subgroup_$i"]));
      }

      //assign Student Id Type
      studentModel.value.studentIdTypeId = Utils.toInt(map["studentIdTypeId"]);

      await super.addItem(studentModel.value.toJson());
    } catch (e) {
      DialogService.showErrorDialog(message: e.toString());
    }
    studentModel.value = StudentModel();
    initializeValues();
    return;
  }
}
