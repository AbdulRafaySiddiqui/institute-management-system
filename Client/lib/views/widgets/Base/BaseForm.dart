import 'package:Client/controllers/BaseItemController.dart';
import 'package:Client/models/BaseModel.dart';
import 'package:Client/service/api/BaseApi.dart';
import 'package:Client/views/widgets/Buttons/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class BaseForm<
    T extends BaseItemController<TModel, TApi>,
    TModel extends BaseModel,
    TApi extends BaseApi<TModel>> extends GetWidget<T> {
  BaseForm({
    Key key,
    @required this.itemName,
    @required this.inputWidgets,
    this.isUpdateForm = false,
    this.initialValue,
  }) : super(key: key);
  final bool isUpdateForm;
  final String itemName;
  final Map<String, dynamic> initialValue;
  final List<Widget> inputWidgets;
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FormBuilder(
          initialValue: initialValue,
          key: _form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isUpdateForm ? "Edit $itemName" : "Add $itemName",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Divider(),
              if (isUpdateForm && initialValue == null)
                Center(
                  child: Text("Select $itemName to edit."),
                )
              else ...{
                //Add the input widgets
                ...inputWidgets,
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Obx(
                      () => PrimaryButton(
                        isBusy: (!isUpdateForm && controller.isAdding.value) ||
                            (isUpdateForm && controller.isUpdating.value),
                        isEnabled:
                            (!controller.isDeleting.value && isUpdateForm) ||
                                !isUpdateForm,
                        text: isUpdateForm ? 'Update' : 'Add',
                        onPressed: () async {
                          if (!_form.currentState.validate()) return;
                          _form.currentState.save();

                          Map<String, dynamic> map = _form.currentState.value;
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
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
