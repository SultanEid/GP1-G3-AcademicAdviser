import 'package:academic_adviser/Models/Appointment.dart';
import 'package:academic_adviser/Models/Attendance.dart';

class Course {
  late String _courseTitle;
  late int _courseNumber;
  late String _courseCode;
  late int _courseHour;
  late String _courseID;
  late int _level;
  int? _grade = 0;
  List<Appointment>? _appointment;
  Attendance? _attendance;

  Course({
    required String courseTitle,
    required int courseNumber,
    required String courseCode,
    required int courseHour,
    required String courseID,
    required int level,
    int? grade,
    List<Appointment>? appointment,
    Attendance? attendance,
  })  : _courseTitle = courseTitle,
        _courseNumber = courseNumber,
        _courseCode = courseCode,
        _courseHour = courseHour,
        _courseID = courseID,
        _level = level,
        _grade = grade,
        _appointment = appointment,
        _attendance = attendance;

  Attendance? get attendance => _attendance;

  set attendance(Attendance? value) {
    _attendance = value;
  }

  List<Appointment>? get appointment => _appointment;

  set appointment(List<Appointment>? value) {
    _appointment = value;
  }

  int? get grade => _grade;

  set grade(int? value) {
    _grade = value;
  }

  int get level => _level;

  set level(int value) {
    _level = value;
  }

  String get courseID => _courseID;

  set courseID(String value) {
    _courseID = value;
  }

  int get courseHour => _courseHour;

  set courseHour(int value) {
    _courseHour = value;
  }

  String get courseCode => _courseCode;

  set courseCode(String value) {
    _courseCode = value;
  }

  int get courseNumber => _courseNumber;

  set courseNumber(int value) {
    _courseNumber = value;
  }

  String get courseTitle => _courseTitle;

  set courseTitle(String value) {
    _courseTitle = value;
  }
}


