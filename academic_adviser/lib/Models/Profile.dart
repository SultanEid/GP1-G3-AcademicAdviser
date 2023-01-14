import 'package:academic_adviser/Models/Certificate.dart';

class Profile {
  String? _profileAvatar;
  late String _role; //student
  late String _department; // computer science
  String? _brief;
  List<Certificate>? _additionalCertificates;
  late List<String> _educationalCertificates;

  Profile(
      {String? profileAvatar,
      required String role,
      required String department,
        String? brief,
        List<Certificate>? additionalCertificates,
      required List<String> educationalCertificates})
      : _profileAvatar = profileAvatar,
        _role = role,
        _department = department,
        _brief = brief,
        _additionalCertificates = additionalCertificates,
        _educationalCertificates = educationalCertificates;

  List<String> get educationalCertificates => _educationalCertificates;

  set educationalCertificates(List<String> value) {
    _educationalCertificates = value;
  }

  List<Certificate>? get additionalCertificates => _additionalCertificates;

  set additionalCertificates(List<Certificate>? value) {
    _additionalCertificates = value;
  }

  String? get brief => _brief;

  set brief(String? value) {
    _brief = value;
  }

  String get department => _department;

  set department(String value) {
    _department = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
  }

  String? get profileAvatar => _profileAvatar;

  set profileAvatar(String? value) {
    _profileAvatar = value;
  }
}
