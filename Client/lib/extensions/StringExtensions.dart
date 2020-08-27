import 'package:Client/models/RoutingData.dart';

extension StringExtensions on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
