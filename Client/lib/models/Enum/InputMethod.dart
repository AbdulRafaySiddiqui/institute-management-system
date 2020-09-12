enum InputMethod {
  TextField,
  ComboBox,
  EditableComboBox,
  DatePicker,
  TimePicker,
  RadioButton,
  CheckBox,
}

extension InputMethodExtension on InputMethod {
  String get displayName {
    switch (this) {
      case InputMethod.TextField:
        return "Text Field";
      case InputMethod.ComboBox:
        return "Combo Box";
      case InputMethod.EditableComboBox:
        return "Editable Combo Box";
      case InputMethod.DatePicker:
        return "Date Picker";
      case InputMethod.TimePicker:
        return "Time Picker";
      case InputMethod.RadioButton:
        return "Radio Button";
      case InputMethod.CheckBox:
        return "Checkbox";
      default:
        return "Unknown";
    }
  }
}
