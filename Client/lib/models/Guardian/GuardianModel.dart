import 'package:Client/models/Base/BaseModel.dart';
import 'package:Client/models/Field/GuardianField.dart';
import 'package:Client/models/Phone/Phone.dart';
import 'package:Client/models/Photo/Photo.dart';

class GuardianModel extends BaseModel {
  GuardianModel();

  int guardianTypeId;
  PhotoModel photo = PhotoModel();
  List<PhoneModel> phones = [];
  List<GuardianFieldModel> guardianFields = [];

  @override
  GuardianModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    id = toInt(map['guardianId']);
    guardianTypeId = toInt(map['guardianTypeId']);
    photo = map["photo"] == null ? null : PhotoModel.fromJson(map['photo']);
    phones = map['phones'] is List
        ? (map['phones'] as List)?.map((e) => PhoneModel.fromJson(e))?.toList()
        : null;
    guardianFields = map['guardianFields'] is List
        ? (map['guardianFields'] as List)
            ?.map((e) => GuardianFieldModel.fromJson(e))
            ?.toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map.addAll({
      "guardianId": id,
      "guardianTypeId": guardianTypeId,
      "photo": photo?.toJson(),
      "phones": phones?.map((e) => e.toJson())?.toList(),
      "guardianFields": guardianFields?.map((e) => e.toJson())?.toList(),
    });
    return map;
  }
}
