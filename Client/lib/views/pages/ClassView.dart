import 'package:Client/localization/EntityNames.dart';
import 'package:Client/models/ClassModel.dart';
import 'package:Client/service/api/ClassApi.dart';
import 'package:Client/viewmodels/ClassViewModel.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ClassView extends StatefulWidget {
  @override
  _ClassViewState createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClassViewModel>(
      create: (context) => ClassViewModel(),
      builder: (context, child) => Consumer<ClassViewModel>(
        builder: (context, viewModel, child) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _form(context: context),
                    _form(isUpdateForm: true, context: context),
                  ],
                )),
            Expanded(
              flex: 5,
              child: BaseListCard(
                isLoading: viewModel.isFetchingData,
                filters: [
                  DropdownButton(
                      hint: Text(EntityNames.branchName),
                      value: viewModel.selectedBranch,
                      items: viewModel.branchList
                          ?.map(
                            (e) => DropdownMenuItem(
                              child: Text(e.name),
                              value: e,
                            ),
                          )
                          ?.toList(),
                      onChanged: (value) => viewModel.selectBranch(value))
                ],
                columns: [
                  DataColumn(label: Text('Name')),
                ],
                rows: List.generate(
                  viewModel.itemsList.length,
                  (i) => DataRow(
                      onSelectChanged: (_) => viewModel.selectItem(i),
                      selected: viewModel.selectedItems[i],
                      cells: [
                        DataCell(Text(viewModel.itemsList[i].name)),
                      ]),
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_form({bool isUpdateForm = false, var context}) {
  ClassViewModel viewModel = Provider.of<ClassViewModel>(context);
  return BaseForm<ClassViewModel, ClassModel, ClassApi>(
    inputWidgets: [
      FormBuilderTextField(
        attribute: 'name',
        decoration: InputDecoration(labelText: "Name"),
        validators: [FormBuilderValidators.required()],
      ),
      FormBuilderDropdown(
        attribute: "branchId",
        decoration: InputDecoration(labelText: EntityNames.branchName),
        validators: [FormBuilderValidators.required()],
        items: viewModel.branchList
            ?.map((item) =>
                DropdownMenuItem(value: item.id, child: Text(item.name)))
            ?.toList(),
      ),
    ],
    itemName: EntityNames.className,
    isUpdateForm: isUpdateForm,
    initialValue:
        isUpdateForm ? viewModel.selectedItem?.toJson() : ClassModel().toJson(),
  );
}
