import 'package:Client/locator/locator.dart';
import 'package:Client/routing/RouteNames.dart';
import 'package:Client/routing/Router.dart';
import 'package:Client/service/NavigationService/NavigationService.dart';
import 'package:Client/views/pages/Layout/Layout.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => Layout(child: child),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: branchRoute,
    );
  }
}
