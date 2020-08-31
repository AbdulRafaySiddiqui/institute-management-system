import 'dart:convert';

import 'package:Client/models/BranchModel.dart';
import 'package:Client/service/api/BaseApi.dart';
import 'package:http/http.dart' as http;

class BranchApi extends BaseApi {
  BranchApi() {
    url = "$baseUrl/branches/";
  }
  String url;

  Future fetchAll() async {
    try {
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        var branches = (json.decode(response.body) as List)
            .map((e) => BranchModel.fromJson(e))
            .toList();
        return branches;
      }

      return 'Could not fetch data at this time.';
    } catch (e) {
      return defaultErrorMessage;
    }
  }

  Future add(BranchModel branch) async {
    try {
      var body = json.encode(branch.toJson());
      var response = await http.post(url, headers: header, body: body);
      if (response.statusCode == 201) {
        return BranchModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      return defaultErrorMessage;
    }
  }

  Future update(BranchModel branch) async {
    try {
      var response =
          await http.post(url, headers: header, body: branch.toJson());
      if (response.statusCode == 201) {
        return BranchModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      return defaultErrorMessage;
    }
  }

  Future delete(int id) async {
    try {
      var response = await http.post("$url/$id", headers: header);
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      return defaultErrorMessage;
    }
  }
}
