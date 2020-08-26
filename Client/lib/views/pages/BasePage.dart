import 'package:Client/constants/colors.dart';
import 'package:Client/views/widgets/SideMenu/SideMenu.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              color: lightPrimary,
            ),
          ),
          SideMenu(),
        ],
      ),
    );
  }
}
