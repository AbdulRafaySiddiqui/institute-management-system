import 'package:Client/constants/colors.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/routing/Routes.dart';
import 'package:Client/views/Layout/Layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IMS',
      theme: Theme.of(context).copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          primaryColor: Palette.primaryColor,
          accentColor: Palette.accentColor,
          scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              buttonColor: Palette.primaryColor,
              textTheme: ButtonTextTheme.primary),
          cardTheme: Theme.of(context)
              .cardTheme
              .copyWith(elevation: 10.0, margin: EdgeInsets.all(20)),
          chipTheme: Theme.of(context).chipTheme.copyWith(
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
      builder: (context, child) => Layout(child: child),
      initialRoute: Routes.branchRoute,
      getPages: Routes.pages,
    );
  }
}
