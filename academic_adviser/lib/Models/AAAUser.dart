
import 'package:academic_adviser/Models/Profile.dart';


class AAAUser {
  late String _uid;
  late String _firstName;
  late String _lastName;
  late String _academicID;
  late String _academicEmail;
  late String _phone;
  late Profile _profile;

  AAAUser({
    required String uid,
    required String firstName,
    required String lastName,
    required String academicID,
    required String academicEmail,
    required Profile profile,
    required String phone,
  }):
        _uid = uid,
        _firstName = firstName,
        _lastName = lastName,
        _academicID = academicID,
        _academicEmail = academicEmail,
        _profile = profile,
  _phone = phone;


  AAAUser.Auth(this._uid);

  Profile get profile => _profile;

  set profile(Profile value) {
    _profile = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get academicEmail => _academicEmail;

  set academicEmail(String value) {
    _academicEmail = value;
  }

  String get academicID => _academicID;

  set academicID(String value) {
    _academicID = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }
}