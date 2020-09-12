import 'package:intl/intl.dart';

class Utils {
  static formateDateOnly(DateTime dateTime) {
    final DateFormat formater = DateFormat(dateFormate);
    final String formatedDate = formater.format(dateTime);
    return formatedDate;
  }

  static String get dateFormate => "dd-MM-yyyy";

  static int toInt(dynamic value) => value == null
      ? 0
      : value is String
          ? int.parse(value)
          : int.parse(value.toString());
}
