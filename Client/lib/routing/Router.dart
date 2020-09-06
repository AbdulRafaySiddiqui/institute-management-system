import 'package:Client/routing/RouteNames.dart';
import 'package:Client/views/pages/BatchView.dart';
import 'package:Client/views/pages/BranchView.dart';
import 'package:Client/views/pages/ClassView.dart';
import 'package:flutter/material.dart';
import 'package:Client/extensions/StringExtensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData;

  //now we can extract the parameters from url and pass it to the widget
  //var value = routingData[key];

  switch (routingData.route) {
    case branchRoute:
      return _getPageRoute(BranchView(), settings);
    case classRoute:
      return _getPageRoute(ClassView(), settings);
    case batchRoute:
      return _getPageRoute(BatchView(), settings);
    default:
      return _getPageRoute(BranchView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
