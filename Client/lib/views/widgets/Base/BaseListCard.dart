import 'package:flutter/material.dart';

class BaseListCard extends StatelessWidget {
  BaseListCard({Key key, @required this.columns, @required this.rows})
      : super(key: key);
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var rowList = List.generate(
      rows.length,
      (i) => DataRow(
          color: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            // All rows will have the same selected color.
            if (states.contains(MaterialState.selected))
              return Theme.of(context).primaryColor.withOpacity(0.2);
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
        child: Row(
          children: [
            Scrollbar(
              isAlwaysShown: true,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: columnList,
                  rows: rowList,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
