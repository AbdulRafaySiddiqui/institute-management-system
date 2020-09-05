import 'package:Client/constants/colors.dart';
import 'package:Client/locator/locator.dart';
import 'package:Client/routing/RouteNames.dart';
import 'package:Client/routing/Router.dart';
import 'package:Client/service/NavigationService/NavigationService.dart';
import 'package:Client/views/Layout/Layout.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      builder: (context, child) => Layout(child: child),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: branchRoute,
    );
  }
}
