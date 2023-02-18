import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/AAAUser.dart';
import 'Alert.dart';
import 'Course.dart';

class Student extends AAAUser {
  late double _gpa;
  late int _totalHours;
  late int _registeredHours;
  late int _planHours;
  late List<Course> _currentStudyingCourses = [];
  late List<Course> _finishedCourses = [];
  List<Score>? _score;
  List<Note>? _notes;
  List<Alert>? _alerts;
  int? _warningsNumber = 0;
  int? _visitsNumber = 0;
  int? _delaysNumber = 0;
  int? _apologiesNumber = 0;
  int? _withdrawalsNumber = 0;
  int? _reenrolmentsNumber = 0;
  AcademicAdvisor? _academicAdvisor;

  Student({
    required String uid,
    required String firstName,
    required String lastName,
    required String studentID,
    required String studentEmail,
    required String studentPhone,
    required Profile studentProfile,
    required double gpa,
    required int totalHours,
    required int registeredHours,
    required int planHours,
    required List<Course> currentStudyingCourses,
    required List<Course> finishedCourses,
    AcademicAdvisor? academicAdvisor,
    List<Score>? score,
    List<Note>? notes,
    List<Alert>? alerts,
    int? warningsNumber,
    int? visitsNumber,
    int? delaysNumber,
    int? apologiesNumber,
    int? withdrawalsNumber,
    int? reenrolmentsNumber,
  })  : _gpa = gpa,
        _totalHours = totalHours,
        _registeredHours = registeredHours,
        _planHours = planHours,
        _currentStudyingCourses = currentStudyingCourses,
        _finishedCourses = finishedCourses,
        _score = score,
        _notes = notes,
        _alerts = alerts,
        _warningsNumber = warningsNumber,
        _visitsNumber = visitsNumber,
        _delaysNumber = delaysNumber,
        _apologiesNumber = apologiesNumber,
        _withdrawalsNumber = withdrawalsNumber,
        _reenrolmentsNumber = reenrolmentsNumber,
        _academicAdvisor = academicAdvisor,
        super(
        uid: uid,
        firstName: firstName,
        lastName: lastName,
        academicID: studentID,
        academicEmail: studentEmail,
        phone: studentPhone,
        profile: studentProfile,
      );

  AcademicAdvisor? get academicAdvisor => _academicAdvisor;

  set academicAdvisor(AcademicAdvisor? value) {
    _academicAdvisor = value;
  }

  int? get visitsNumber => _visitsNumber;

  set visitsNumber(int? value) {
    _visitsNumber = value;
  }

  int? get warningsNumber => _warningsNumber;

  set warningsNumber(int? value) {
    _warningsNumber = value;
  }

  List<Alert>? get alerts => _alerts;

  set alerts(List<Alert>? value) {
    _alerts = value;
  }

  List<Note>? get notes => _notes;

  set notes(List<Note>? value) {
    _notes = value;
  }

  List<Score>? get score => _score;

  set score(List<Score>? value) {
    _score = value;
  }

  List<Course> get finishedCourses => _finishedCourses;

  set finishedCourses(List<Course> value) {
    _finishedCourses = value;
  }

  List<Course> get currentStudyingCourses => _currentStudyingCourses;

  set currentStudyingCourses(List<Course> value) {
    _currentStudyingCourses = value;
  }

  int get planHours => _planHours;

  set planHours(int value) {
    _planHours = value;
  }

  int get registeredHours => _registeredHours;

  set registeredHours(int value) {
    _registeredHours = value;
  }

  int get totalHours => _totalHours;

  set totalHours(int value) {
    _totalHours = value;
  }

  double get gpa => _gpa;

  set gpa(double value) {
    _gpa = value;
  }

  int? get delaysNumber => _delaysNumber;

  set delaysNumber(int? value) {
    _delaysNumber = value;
  }

  int? get apologiesNumber => _apologiesNumber;

  set apologiesNumber(int? value) {
    _apologiesNumber = value;
  }

  int? get withdrawalsNumber => _withdrawalsNumber;

  set withdrawalsNumber(int? value) {
    _withdrawalsNumber = value;
  }

  int? get reenrolmentsNumber => _reenrolmentsNumber;

  set reenrolmentsNumber(int? value) {
    _reenrolmentsNumber = value;
  }
}
