import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isBusy;
  final Function onPressed;
  final bool isEnabled;
  final Color color;
  final bool outlined;
  const PrimaryButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.isBusy = false,
    this.isEnabled = true,
    this.color,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return outlined
        ? OutlineButton(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 4),
            onPressed: isBusy || !isEnabled ? null : onPressed,
            child: isBusy
                ? SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator())
                : Text(
                    text,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
          )
        : RaisedButton(
            color: color,
            onPressed: isBusy || !isEnabled ? null : onPressed,
            child: isBusy
                ? SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator())
                : Text(text),
          );
  }
}
