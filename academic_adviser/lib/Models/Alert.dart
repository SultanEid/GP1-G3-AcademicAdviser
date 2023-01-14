class Alert {
  late String _alertTitle;
  late String _alertContent;
  late String _alertDate;
  late int _alertDegree;

  Alert({
    required String alertContent,
    required String alertTitle,
    required String alertDate,
    required int alertDegree,
  })  : _alertContent = alertContent,
        _alertTitle = alertTitle,
        _alertDate = alertDate,
        _alertDegree = alertDegree;

  int get alertDegree => _alertDegree;

  set alertDegree(int value) {
    _alertDegree = value;
  }

  String get alertDate => _alertDate;

  set alertDate(String value) {
    _alertDate = value;
  }

  String get alertContent => _alertContent;

  set alertContent(String value) {
    _alertContent = value;
  }

  String get alertTitle => _alertTitle;

  set alertTitle(String value) {
    _alertTitle = value;
  }
}
