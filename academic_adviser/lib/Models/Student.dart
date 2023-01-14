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
    List<Score>? score,
    List<Note>? notes,
    List<Alert>? alerts,
  })  : _gpa = gpa,
        _totalHours = totalHours,
        _registeredHours = registeredHours,
        _planHours = planHours,
        _currentStudyingCourses = currentStudyingCourses,
        _finishedCourses = finishedCourses,
        _score = score,
        _notes = notes,
        _alerts = alerts,
        super(
          uid: uid,
          firstName: firstName,
          lastName: lastName,
          academicID: studentID,
          academicEmail: studentEmail,
          phone: studentPhone,
          profile: studentProfile,
        );

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
}
