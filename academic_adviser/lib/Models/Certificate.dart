import 'dart:html';

class Certificate {
  late String _certificateTitle;
  late String _certificateIssuer;
  late String _date;
  File? _file;

  Certificate(
      {required String certificateTitle,
      required String certificateIssuer,
      required String date,
      File? file})
      : _certificateTitle = certificateTitle,
        _certificateIssuer = certificateIssuer,
        _date = date,
        _file = file;

  File? get file => _file;

  set file(File? value) {
    _file = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get certificaIssuer => _certificateIssuer;

  set certificaIssuer(String value) {
    _certificateIssuer = value;
  }

  String get certificateTitle => _certificateTitle;

  set certificateTitle(String value) {
    _certificateTitle = value;
  }
}
