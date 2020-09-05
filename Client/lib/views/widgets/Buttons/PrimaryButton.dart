import 'package:flutter/material.dart';

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
