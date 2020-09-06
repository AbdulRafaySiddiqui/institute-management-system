import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget addForm;
  final Widget updateForm;
  final Widget listCard;
  final bool isLoading;

  const BaseView(
      {Key key, this.addForm, this.updateForm, this.listCard, this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [addForm, updateForm],
                  ),
                ),
                Expanded(flex: 5, child: listCard)
              ],
            ),
          );
  }
}
