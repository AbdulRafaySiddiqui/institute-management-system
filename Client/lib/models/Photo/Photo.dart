import 'dart:typed_data';
import 'dart:convert';
import 'package:Client/models/Base/BaseModel.dart';

class PhotoModel extends BaseModel {
  PhotoModel({int id}) : super(id: id);
  Uint8List data;

  @override
  PhotoModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['photoId']);
    data = map['data'] == null
        ? null
        : map["data"] is Uint8List
            ? map["data"]
            : Base64Decoder().convert(map['data']);
  }

  @override
  Map<String, dynamic> toJson() {
    if (data == null) return null;
    var map = super.toJson();
    map.addAll({
      "photoId": id,
      "data": data,
    });
    return map;
  }
}
