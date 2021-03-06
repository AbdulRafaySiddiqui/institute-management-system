import 'package:flutter/material.dart';

class BaseListCard extends StatelessWidget {
  BaseListCard(
      {Key key,
      @required this.columns,
      @required this.rows,
      this.filters,
      this.isLoading = false})
      : super(key: key);
  final bool isLoading;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final List<Widget> filters;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var rowList = List.generate(
      rows.length,
      (i) => DataRow(
          color: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            // All rows will have the same selected color.
            if (states.contains(MaterialState.selected)) return Colors.grey;
            // Even rows will have a grey color.
            if (i % 2 == 0) return Colors.grey.withOpacity(0.1);
            return null; // Use default value for other states and odd rows.
          }),
          cells: [DataCell(Text((i + 1).toString())), ...rows[i].cells],
          onSelectChanged: rows[i].onSelectChanged,
          selected: rows[i].selected),
    );
    var columnList = [DataColumn(label: Text("S. No.")), ...columns];
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            if (filters != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: filters
                    .map((e) =>
                        Padding(padding: EdgeInsets.only(left: 20), child: e))
                    .toList(),
              ),
            Divider(),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          showCheckboxColumn: false,
                          columns: columnList,
                          rows: rowList,
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
