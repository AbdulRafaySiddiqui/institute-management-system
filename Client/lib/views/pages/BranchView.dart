import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BranchApi.dart';
import 'package:Client/viewmodels/BranchViewModel.dart';
import 'package:Client/views/widgets/Base/BaseForm.dart';
import 'package:Client/views/widgets/Base/BaseListCard.dart';
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
      builder: (context, child) => Consumer<BranchViewModel>(
        builder: (context, viewModel, child) => Row(
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
            Expanded(
              flex: 5,
              child: viewModel.isFetchingData
                  ? Center(child: CircularProgressIndicator())
                  : BaseListCard(
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

_form({var isUpdateForm = false, var context}) {
  return BaseForm<BranchViewModel, BranchModel, BranchApi>(
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
