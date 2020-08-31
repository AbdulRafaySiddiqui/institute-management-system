import 'package:Client/views/widgets/BaseForm/BaseItemViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class BaseForm<T extends BaseItemViewModel> extends StatelessWidget {
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
                  child: Text("Select a branch to edit."),
                )
              else ...{
                //Add the input widgets
                ...inputWidgets,
                SizedBox(height: 20),
                Consumer<T>(
                  builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      PrimaryButton(
                        isBusy: (!isUpdateForm && value.isAdding) ||
                            (isUpdateForm && value.isUpdating),
                        isEnabled: (!value.isDeleting && isUpdateForm) ||
                            !isUpdateForm,
                        text: isUpdateForm ? 'Update' : 'Add',
                        onPressed: () async {
                          if (!_form.currentState.validate()) return;
                          _form.currentState.save();

                          Map<String, dynamic> map = _form.currentState.value;
                          print(map);
                          if (isUpdateForm)
                            await value.updateItem(_form.currentState.value);
                          else
                            await value.addItem(map);

                          _form.currentState.reset();
                        },
                      ),
                      if (isUpdateForm) ...{
                        PrimaryButton(
                          isBusy: value.isDeleting,
                          isEnabled: !value.isUpdating,
                          text: "Delete",
                          color: Colors.red,
                          onPressed: () async {
                            await value.deleteItem();
                            _form.currentState.reset();
                          },
                        ),
                      },
                    ],
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isBusy;
  final Function onPressed;
  final bool isEnabled;
  final Color color;
  const PrimaryButton({
    Key key,
    this.text,
    this.onPressed,
    this.isBusy = false,
    this.isEnabled = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: isBusy || !isEnabled ? null : onPressed,
      child: isBusy
          ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
          : Text(text),
    );
  }
}
