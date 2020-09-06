abstract class BaseModel {
  BaseModel({this.id});
  int id;

  String createdBy;
  DateTime dateTimeCreated;

  String modifiedBy;
  DateTime dateTimeModified;

  toInt(dynamic value) => value == null
      ? 0
      : value is String
          ? int.parse(value)
          : int.parse(value.toString());

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
