import 'package:Client/viewmodels/BranchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchList extends StatefulWidget {
  const BranchList({Key key}) : super(key: key);
  @override
  _BranchListState createState() => _BranchListState();
}

class _BranchListState extends State<BranchList> {
  final scrollController = ScrollController();
  BranchViewModel branchViewModel;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      branchViewModel = Provider.of<BranchViewModel>(context);
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    branchViewModel.itemsList
        .forEach((element) => print(element.toJson().toString()));
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: branchViewModel.isFetchingData
            ? Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  Scrollbar(
                    isAlwaysShown: true,
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(label: Text('S.No.')),
                          DataColumn(label: Text('Name')),
                        ],
                        rows: List<DataRow>.generate(
                          branchViewModel.itemsList.length,
                          (i) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              // All rows will have the same selected color.
                              if (states.contains(MaterialState.selected))
                                return Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2);
                              // Even rows will have a grey color.
                              if (i % 2 == 0)
                                return Colors.grey.withOpacity(0.1);
                              return null; // Use default value for other states and odd rows.
                            }),
                            selected: branchViewModel.selectedItems[i],
                            onSelectChanged: (value) {
                              branchViewModel.selectItem(i);
                            },
                            cells: [
                              DataCell(Text((i + 1).toString())),
                              DataCell(Text(branchViewModel.itemsList[i].name ??
                                  "empty")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
