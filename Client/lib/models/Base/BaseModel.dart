import 'package:Client/Utils/Utils.dart';

abstract class BaseModel {
  BaseModel({this.id});
  int id;

  String createdBy;
  DateTime dateTimeCreated;

  String modifiedBy;
  DateTime dateTimeModified;

  int toInt(dynamic value) => Utils.toInt(value);

  BaseModel.fromJson(Map<String, dynamic> map) {
    createdBy = map["createdBy"];
    modifiedBy = map["modifiedBy"];
    dateTimeCreated = map["dateTimeCreated"] == null
        ? null
        : DateTime.parse(map["dateTimeCreated"]);
    dateTimeModified = map["dateTimeModified"] == null
        ? null
        : DateTime.parse(map["dateTimeModified"]);
  }

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "dateTimeCreated": dateTimeCreated?.toString(),
        "dateTimeModified": dateTimeCreated?.toString(),
      };
}
