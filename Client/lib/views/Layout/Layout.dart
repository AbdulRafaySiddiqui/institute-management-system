import 'package:Client/views/widgets/SideMenu/SideMenu.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: child,
          ),
          SideMenu(),
        ],
      ),
    );
  }
}
