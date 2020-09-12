import 'package:Client/localization/EntityNames.dart';

enum PersonType {
  Student,
  Guardian,
  Teacher,
  Staff,
}

extension PersonTypeExtension on PersonType {
  String get displayName {
    switch (this) {
      case PersonType.Student:
        return EntityNames.studentName;
      case PersonType.Guardian:
        return EntityNames.guardianName;
      case PersonType.Teacher:
        return EntityNames.teacherName;
      case PersonType.Staff:
        return EntityNames.staffName;
      default:
        return "Unknown";
    }
  }
}
