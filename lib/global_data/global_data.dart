class GlobalData
{
  late Map _formValues;
  //******** Getter and Setter for the form values
  Map get formValues => _formValues;

  set formValues(Map entry) {
    _formValues.addAll(entry);
  }

  GlobalData._()
  {
    _formValues = {};
  }
  static final GlobalData _instance = GlobalData._();
  factory GlobalData({Map? entry})
  {
    if(entry!=null)
    {
      _instance.formValues = entry;
    }
    return _instance;
  }
}