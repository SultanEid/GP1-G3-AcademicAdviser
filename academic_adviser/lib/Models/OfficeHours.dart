class OfficeHours {
  late String _officeHoursFrom;
  late String _officeHoursTo;
  late String _day;

  OfficeHours({required String officeHoursFrom,required String officeHoursTo,required String day})
      : _officeHoursFrom = officeHoursFrom,
        _officeHoursTo = officeHoursTo,
        _day = day;

  String get day => _day;

  set day(String value) {
    _day = value;
  }

  String get officeHoursTo => _officeHoursTo;

  set officeHoursTo(String value) {
    _officeHoursTo = value;
  }

  String get officeHoursFrom => _officeHoursFrom;

  set officeHoursFrom(String value) {
    _officeHoursFrom = value;
  }
}
