import 'package:Client/models/Enum/ValidationType.dart';
import 'package:intl/intl.dart';

extension insertExtension on List {
  List insertAt(int index, dynamic element) {
    this.insert(index, element);
    return this;
  }
}

class Utils {
  static String formateDateOnly(DateTime dateTime) {
    final DateFormat formater = DateFormat(dateDisplayFormate);
    final String formatedDate = formater.format(dateTime);
    return formatedDate;
  }

  static String formateTimeOnly(DateTime dateTime) {
    final DateFormat formater = DateFormat(timeFormate);
    final String formatedDate = formater.format(dateTime);
    return formatedDate;
  }

  static String get dateFormate => "yyyy-MM-dd";
  static String get dateDisplayFormate => "dd-MMMM-yyyy";

  static String get timeFormate => "hh:mm";

  static int toInt(dynamic value) => value == null
      ? 0
      : value is String
          ? int.parse(value)
          : int.parse(value.toString());

  static String getValidationRegex(ValidationType type) {
    String regexPattern;
    switch (type) {
      case ValidationType.Text:
        regexPattern = "*";
        break;
      case ValidationType.Alphabetic:
        regexPattern = '[a-zA-Z]';
        break;
      case ValidationType.Numeric:
        regexPattern = r'\d';
        break;
      case ValidationType.Email:
        regexPattern =
            r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
        break;
      case ValidationType.Phone:
        regexPattern = r"03[0-9]{2}-[0-9]{7}$";
        break;
      case ValidationType.FirstName:
        regexPattern = "*";
        break;
      case ValidationType.MiddleName:
        regexPattern = "*";
        break;
      case ValidationType.LastName:
        regexPattern = "*";
        break;
    }
    return regexPattern;
  }

  static dynamic getInitialValue(String attribute, dynamic initialValue) {
    var props = attribute.split('.');

    //if property is not nested return its value from map
    if (props.length < 2)
      return (initialValue?.containsKey(attribute) ?? false)
          ? initialValue[attribute]
          : null;

    //iterate to find the nested value

    //to track if current value is a Map or a List
    var isMap = initialValue is Map;

    //holds the map values
    Map<String, dynamic> map = isMap ? initialValue : null;

    //holds the list values
    List list = isMap ? null : initialValue;

    //loop all props
    for (var i = 0; i < props.length - 1; i++) {
      //if prop is key for list we need to convert it to INT
      var key = isMap ? props[i] : int.parse(props[i]);

      //if the next prop is a Map type then assign it to the map variable
      if ((isMap && map[key] is Map) || (!isMap && list[key] is Map)) {
        map = isMap ? map[key] : list[key];
        //this tells if the current value is stored in the map or list variable
        isMap = true;
      }
      //else of its a List type then assign it to the list varaible
      else if ((isMap && map[key] is List) || (!isMap && list[key] is List)) {
        list = isMap ? map[key] : list[key];
        //this tells if the current value is stored in the map or list variable
        isMap = false;
      }
    }

    return isMap ? map[props.last] : list[int.parse(props.last)];
  }

  //recursively generates the map accroding to the attribute
  dynamic getMap(List<String> props, dynamic value, dynamic map) {
    if (props.isEmpty) return value;

    if (props.length == 1) return {...map ?? {}, props.single: value};

    //if the next prop is an integer then we have a list
    var key = int.tryParse(props[1]);
    if (key != null) {
      var list = map == null ? [] : [...(map[props.first] ?? {})];
      //if list is shorter than the provided index append null objects to list till we have the requred length of list
      if (list.length <= key)
        list.addAll(List.generate(key + 1 - list.length, (index) => null));

      list[key] = getMap(props.sublist(2), value, list[key]);
      return {...map ?? {}, props.first: list};
    } else {
      return {
        ...map ?? {},
        props.first:
            getMap(props.sublist(1), value, map == null ? {} : map[props.first])
      };
    }
  }
}
