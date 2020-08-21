using System.ComponentModel;

namespace Domain
{
    public enum InputMethod
    {
        [Description("Text Field")]
        TextField,

        [Description("Combo Box")]
        ComboBox,

        [Description("Editable Combo Box")]
        EditableComboBox,

        [Description("Date Picker")]
        DatePicker,

        [Description("Time Picker")]
        TimePicker,

        [Description("Radio Button")]
        RadioButton,

        [Description("Check Box")]
        CheckBox,
    }
}
