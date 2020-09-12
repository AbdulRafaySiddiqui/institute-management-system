import 'dart:io';
import 'package:Client/models/Base/BaseModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BaseApi<T extends BaseModel> {
  BaseApi(String apiEndPoint, {bool useFilteredFetchOnly = true}) {
    _url = "$_baseUrl/$apiEndPoint";
    _useFilteredFetchOnly = useFilteredFetchOnly;
  }

  String _baseUrl = 'https://localhost:5001/api';
  String _defaultErrorMessage = 'Something went wrong..!';
  Map<String, String> _header = {
    HttpHeaders.authorizationHeader:
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYTM3OTU4My01NWNmLTQzYjItYjViZC0wNDgwYzUyOWYwYTEiLCJuYmYiOjE1OTk2ODQ5OTMsImV4cCI6MTYwMjI3Njk5MywiaWF0IjoxNTk5Njg0OTkzfQ.8wCJLUNHN_pGpeSoM4dTkewknxIjqkELBq4_vV4BdVDFNYFxvLqCY6VP_SuVsxo_R5t5pXvfXXfYeMsMQl_1kw",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  String _url;
  bool _useFilteredFetchOnly;
  T fromJson(Map<String, dynamic> map);

  Future fetchAll({int id}) async {
    if (_useFilteredFetchOnly && id == null && id == 0)
      throw Exception("Id cannot be null or empty.");
    try {
      var url = _useFilteredFetchOnly ? "$_url/filter/$id" : _url;
      var response = await http.get(url, headers: _header);

      if (response.statusCode == 200) {
        var items = (json.decode(response.body) as List)
            .map((e) => fromJson(e))
            .toList();
        return items;
      }

      return 'Could not fetch data at this time.';
    } catch (e) {
      return _defaultErrorMessage;
    }
  }

  Future add(T item) async {
    try {
      var body = json.encode(item.toJson());
      var response = await http.post(_url, headers: _header, body: body);
      if (response.statusCode == 201) {
        return fromJson(json.decode(response.body));
      }
      return _defaultErrorMessage;
    } catch (e) {
      return _defaultErrorMessage;
    }
  }

  Future update(T item) async {
    try {
      var body = json.encode(item.toJson());
      var response = await http.put(_url, headers: _header, body: body);
      if (response.statusCode == 200) {
        return fromJson(json.decode(response.body));
      }
    } catch (e) {
      return _defaultErrorMessage;
    }
  }

  Future delete(int id) async {
    try {
      var response = await http.delete("$_url/$id", headers: _header);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      return _defaultErrorMessage;
    }
  }
}
