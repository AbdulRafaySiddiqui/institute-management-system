import 'package:Client/models/BranchModel.dart';
import 'package:Client/viewmodels/BranchViewModel.dart';
import 'package:Client/views/widgets/BaseForm/BaseForm.dart';
import 'package:Client/views/widgets/Branch/BranchList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class BranchView extends StatefulWidget {
  @override
  _BranchViewState createState() => _BranchViewState();
}

class _BranchViewState extends State<BranchView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BranchViewModel>(
      create: (context) => BranchViewModel(),
      builder: (context, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  _form(),
                  _form(isUpdateForm: true, context: context),
                ],
              )),
          Expanded(flex: 5, child: BranchList())
        ],
      ),
    );
  }
}

_form({var isUpdateForm = false, var context}) {
  return BaseForm<BranchViewModel>(
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'name',
        decoration: InputDecoration(labelText: "Name"),
        validators: [FormBuilderValidators.required()],
      ),
    ],
    itemName: "Branch",
    isUpdateForm: isUpdateForm,
    initialValue: isUpdateForm
        ? Provider.of<BranchViewModel>(context).selectedItem?.toJson()
        : BranchModel().toJson(),
  );
}
