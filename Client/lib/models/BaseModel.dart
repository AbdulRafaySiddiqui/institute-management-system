class BaseModel {
  BaseModel({this.id});
  int id;

  toInt(dynamic value) => value == null
      ? 0
      : value is String ? int.parse(value) : int.parse(value.toString());
}
