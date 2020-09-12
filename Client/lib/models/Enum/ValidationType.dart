enum ValidationType {
  Text,
  Alphabetic,
  Numeric,
  Email,
  Phone,
  FirstName,
  MiddleName,
  LastName,
}

extension ValidationTypeExtension on ValidationType {
  String get displayName {
    switch (this) {
      case ValidationType.Text:
        return "Text";
      case ValidationType.Alphabetic:
        return "Alphabetic";
      case ValidationType.Numeric:
        return "Numeric";
      case ValidationType.Email:
        return "Email";
      case ValidationType.Phone:
        return "Phone";
      case ValidationType.FirstName:
        return "First Name";
      case ValidationType.MiddleName:
        return "Middle Name";
      case ValidationType.LastName:
        return "Last Name";
      default:
        return "Unknown";
    }
  }
}
