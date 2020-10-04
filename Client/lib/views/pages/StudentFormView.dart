import 'package:Client/controllers/StudentFormViewController.dart';
import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/export.dart';
import 'package:Client/utils/Utils.dart';
import 'package:Client/views/widgets/Buttons/PrimaryButton.dart';
import 'package:Client/views/widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentFormView extends StatelessWidget {
  final bool isUpdateForm = Get.arguments != null;
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
  final controller = Get.put(StudentFormViewController());
  final double fieldWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FormBuilder(
                    initialValue: controller.initialValues,
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Main Header
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            isUpdateForm
                                ? "Edit ${EntityNames.studentName}"
                                : "Add ${EntityNames.studentName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Student Id Type
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 200,
                              child: FormBuilderDropdown(
                                decoration: InputDecoration(
                                    labelText: EntityNames.studentIdTypeName),
                                validators: [FormBuilderValidators.required()],
                                attribute: "studentIdTypeId",
                                items: controller.idTypeList
                                    ?.map((e) => DropdownMenuItem(
                                          child: Text(e.codeName),
                                          value: e.id,
                                        ))
                                    ?.toList(),
                              ),
                            ),
                            //Class
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 200,
                              child: FormBuilderDropdown(
                                attribute: "class",
                                decoration: InputDecoration(
                                    labelText: EntityNames.className),
                                isExpanded: true,
                                validators: [FormBuilderValidators.required()],
                                items: controller.classList
                                    ?.map((e) => DropdownMenuItem(
                                          child: Text(e.name),
                                          value: e,
                                        ))
                                    ?.toList(),
                                onChanged: (value) {
                                  controller.selectedClass.value = value;
                                },
                              ),
                            ),
                            //Batch
                            if (controller.selectedClass.value != null)
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: 200,
                                  child: FormBuilderDropdown(
                                    decoration: InputDecoration(
                                        labelText: EntityNames.batchName),
                                    validators: [
                                      FormBuilderValidators.required()
                                    ],
                                    attribute: "batch",
                                    items: controller
                                        .selectedClass.value?.batches
                                        ?.map((e) => DropdownMenuItem(
                                            child: Text(e.name), value: e))
                                        ?.toList(),
                                    onChanged: (batch) =>
                                        controller.selectedBatch.value = batch,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        //Group
                        if (controller.selectedBatch.value != null &&
                            controller.selectedBatch.value.groups != null)
                          Obx(
                            () => Row(
                              children: [
                                ...List<Widget>.generate(
                                  controller.selectedBatch.value.groups.length,
                                  (index) => Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 200,
                                    child: FormBuilderDropdown(
                                      decoration: InputDecoration(
                                          labelText: controller.selectedBatch
                                              .value.groups[index].name),
                                      validators: [
                                        FormBuilderValidators.required()
                                      ],
                                      attribute: "subgroup_$index",
                                      items: controller.selectedBatch.value
                                          .groups[index].subgroups
                                          ?.map((e) {
                                        return DropdownMenuItem(
                                          child: Text(e.name),
                                          value: e.id,
                                        );
                                      })?.toList(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                        SizedBox(
                          height: 20,
                        ),

                        ..._studentInformation(),

                        SizedBox(
                          height: 40,
                        ),

                        ..._guardianInformation(),

                        SizedBox(
                          height: 40,
                        ),

                        ..._feeDiscounts(),

                        //Submit Button
                        Row(
                          children: [
                            //Add/Update Button
                            Obx(
                              () => Align(
                                alignment: Alignment.centerRight,
                                child: PrimaryButton(
                                  isBusy: (!isUpdateForm &&
                                          controller.isAdding.value) ||
                                      (isUpdateForm &&
                                          controller.isUpdating.value),
                                  isEnabled: (!controller.isDeleting.value &&
                                          isUpdateForm) ||
                                      !isUpdateForm,
                                  text: isUpdateForm ? 'Update' : 'Add',
                                  onPressed: () async {
                                    if (!_form.currentState.validate()) return;
                                    _form.currentState.save();

                                    Map<String, dynamic> map =
                                        _form.currentState.value;

                                    if (isUpdateForm)
                                      await controller
                                          .updateItem(_form.currentState.value);
                                    else {
                                      await controller.addItem(map);
                                      _form.currentState?.reset();
                                    }
                                  },
                                ),
                              ),
                            ),

                            //Delete Button
                            if (isUpdateForm) ...{
                              Obx(
                                () => PrimaryButton(
                                  isBusy: controller.isDeleting.value,
                                  isEnabled: !controller.isUpdating.value,
                                  text: "Delete",
                                  color: Colors.red,
                                  onPressed: () async {
                                    await controller.deleteItem();
                                  },
                                ),
                              ),
                            },
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  _studentInformation() {
    return [
      //Student Information Header
      Text(
        "${EntityNames.studentName} Information",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Get.theme.primaryColor),
      ),

      Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Select Image
              Align(
                  alignment: Alignment.centerLeft,
                  child: ImagePicker(onImageSelect: (data) {
                    controller.studentModel.value.photo.data = data;
                  })),

              //Student Info
              SizedBox(
                width: 40,
              ),

              Wrap(
                spacing: 20.0,
                children: [
                  ...controller.studentFieldList
                      ?.map((e) => SizedBox(
                          width: fieldWidth, child: _createInputWidget(e)))
                      ?.toList(),
                ],
              ),
              //Phones
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._phoneList(
                          phoneList: controller.studentModel.value.phones,
                          onAdd: () => controller.addStudentPhone(),
                          onDelete: () => controller.removeStudentPhone(),
                          personType: PersonType.Student)
                    ],
                  ))
            ],
          ),
        ),
      ),
    ];
  }

  _guardianInformation() {
    return [
      //Guardians Information Header
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${EntityNames.guardianName} Information",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Get.theme.primaryColor),
          ),
          //add button
          IconButton(
              icon: Icon(Icons.add),
              color: Colors.green,
              onPressed: () => controller.addGuardian()),
          //delete button
          IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => controller.removeGuardian())
        ],
      ),

      //Guardian List
      Obx(
        () => Column(
          children: [
            ...List<Widget>.generate(
              controller.studentModel.value.studentGuardians.length,
              (index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //Image
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ImagePicker(
                                onImageSelect: (imageBytes) => controller
                                    .studentModel
                                    .value
                                    .studentGuardians[index]
                                    .guardian
                                    .photo
                                    .data = imageBytes),
                          ),
                          //Guardian Type
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: fieldWidth,
                              child: FormBuilderDropdown(
                                attribute: "guardian_${index}_guardianTypeId",
                                initialValue:
                                    controller.initialGuardianTypeId.value,
                                decoration: InputDecoration(
                                    labelText: EntityNames.guardianType),
                                validators: [FormBuilderValidators.required()],
                                items: controller.guardianTypeList
                                    .map((e) => DropdownMenuItem(
                                          value: e.id,
                                          child: Text(e.name),
                                        ))
                                    .toList(),
                                onChanged: null,
                              ),
                            ),
                          ),
                          //Info
                          Wrap(
                            spacing: 20.0,
                            children: [
                              ...List<Widget>.generate(
                                controller.guardianFieldList.length,
                                (index) => SizedBox(
                                  width: fieldWidth,
                                  child: _createInputWidget(
                                      controller.guardianFieldList[index],
                                      index: index),
                                ),
                              ),
                            ],
                          ),

                          //Phones
                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ..._phoneList(
                                    phoneList: controller
                                        .studentModel
                                        .value
                                        .studentGuardians[index]
                                        .guardian
                                        .phones,
                                    onAdd: () =>
                                        controller.addGuardianPhone(index),
                                    onDelete: () =>
                                        controller.removeGurdianPhone(index),
                                    personType: PersonType.Guardian,
                                    personIndex: index)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ];
  }

  _feeDiscounts() {
    return [
      //Fee Discount
      Text(
        "${EntityNames.feeName} Discount",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Get.theme.primaryColor),
      ),
      Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DataTable(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            showCheckboxColumn: false,
            columns: [
              DataColumn(label: Text(EntityNames.feeName)),
              DataColumn(label: Text("Amount")),
              DataColumn(label: Text("Discount")),
            ],
            rows: List<DataRow>.generate(
              controller.batchFeeList.length,
              (index) => DataRow(cells: [
                DataCell(Text(controller.batchFeeList[index].feeType.name)),
                DataCell(
                    Text(controller.batchFeeList[index].amount.toString())),
                DataCell(
                  FormBuilderTextField(
                    attribute: "fee_${controller.batchFeeList[index].id}",
                    validators: [FormBuilderValidators.numeric()],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ];
  }

  _phoneList(
      {@required List<PhoneModel> phoneList,
      @required Function onAdd,
      @required Function onDelete,
      @required PersonType personType,
      //this is only for guardians (to set currect attribute), because there can be multiple gaurdians
      int personIndex}) {
    return [
      //Phones
      SizedBox(height: 20),
      Row(
        children: [
          Text(
            EntityNames.phoneName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          //add button
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.green,
            onPressed: onAdd,
          ),
          //delete button
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: onDelete,
          )
        ],
      ),
      Column(
        children: [
          ...List<Widget>.generate(
            phoneList.length,
            (index) => SizedBox(
              width: 300,
              child: Row(
                children: [
                  //phone number
                  Expanded(
                    child: FormBuilderTextField(
                      decoration:
                          InputDecoration(labelText: EntityNames.phoneName),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.pattern(
                            Utils.getValidationRegex(ValidationType.Phone),
                            errorText: "Invalid number. (e.g: 03XX-XXXXXX)")
                      ],
                      attribute:
                          //assign the correct attribute
                          () {
                        String attribute;
                        switch (personType) {
                          case PersonType.Student:
                            return attribute = "student_phone_$index";
                          case PersonType.Guardian:
                            return attribute =
                                "guardian_${personIndex}_phone_$index";
                            break;
                          case PersonType.Teacher:
                            return attribute = "teacher_phone_$index";
                          case PersonType.Staff:
                            return attribute = "staff_phone_$index";
                        }
                        return attribute;
                      }(),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 120,
                    child: FormBuilderCheckbox(
                      label: Text("Enable ${EntityNames.smsName}"),
                      initialValue: true,
                      attribute:
                          //assign the correct attribute
                          () {
                        String attribute;
                        switch (personType) {
                          case PersonType.Student:
                            return attribute =
                                "student_phone_isSmsEnable_$index";
                          case PersonType.Guardian:
                            return attribute =
                                "guardian_${personIndex}_phone_isSmsEnable_$index";
                            break;
                          case PersonType.Teacher:
                            return attribute =
                                "teacher_phone_isSmsEnable_$index";
                          case PersonType.Staff:
                            return attribute = "staff_phone_isSmsEnable_$index";
                        }
                        return attribute;
                      }(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ];
  }

  _createInputWidget(FieldModel field, {int index}) {
    var fieldName = field.personType == PersonType.Student
        ? "student_"
        : "guardian_${index}_";
    var regexPattern = Utils.getValidationRegex(field.validationType);

    switch (field.inputMethod) {
      case InputMethod.TextField:
        return FormBuilderTextField(
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(100),
            if (regexPattern != "*") FormBuilderValidators.pattern(regexPattern)
          ],
          attribute: fieldName + field.name,
          decoration: InputDecoration(labelText: field.name),
        );

      case InputMethod.ComboBox:
        return FormBuilderDropdown(
          attribute: fieldName + field.name,
          decoration: InputDecoration(labelText: field.name),
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
          ],
          items: field.defaultValues
              ?.map(
                (e) => DropdownMenuItem(
                  child: Text(e.value),
                  value: e.value,
                ),
              )
              ?.toList(),
        );

      case InputMethod.EditableComboBox:
        throw Exception("Not Implemented");
        break;

      case InputMethod.DatePicker:
        return FormBuilderDateTimePicker(
          attribute: fieldName + field.name,
          decoration: InputDecoration(labelText: field.name),
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
          ],
          inputType: InputType.date,
          format: DateFormat(Utils.dateFormate),
          // valueTransformer: (value) {
          //   if (value != null) return Utils.formateDateOnly(value);
          // },
        );

      case InputMethod.TimePicker:
        return FormBuilderDateTimePicker(
          attribute: fieldName + field.name,
          decoration: InputDecoration(labelText: field.name),
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
          ],
          inputType: InputType.time,
          format: DateFormat(Utils.timeFormate),
          // valueTransformer: (value) {
          //   if (value != null) return Utils.formateTimeOnly(value);
          // },
        );

      case InputMethod.RadioButton:
        return FormBuilderRadioGroup(
          attribute: fieldName + field.name,
          decoration: InputDecoration(labelText: field.name),
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
          ],
          options: field.defaultValues.map((e) =>
              FormBuilderFieldOption(value: e.value, child: Text(e.value))),
        );

      case InputMethod.CheckBox:
        return FormBuilderCheckbox(
          attribute: fieldName + field.name,
          initialValue: false,
          label: Text(field.name),
          validators: [
            if (field.isRequired) FormBuilderValidators.required(),
          ],
        );
    }
  }
}
