import 'package:academic_adviser/Models/Course.dart';

class Score {
  late String _scoreName;
  String? _scoreDescription;
  late List<Course> _scoreCourses;
  late List<double> _coursesPercentage;
  double? _score = 0;
  int _excellentPercent = 100;
  late int _goodPercent;
  late int _badPercent;

  Score(
      {required String scoreName,
        String? scoreDescription,
        required List<Course> scoreCourses,
        required List<double> coursesPercentage,
        required int goodPercent,
        required int badPercent,
      }):_scoreName=scoreName,
  _scoreDescription=scoreDescription,
  _scoreCourses=scoreCourses,
  _coursesPercentage=coursesPercentage,
        _goodPercent = goodPercent,
  _badPercent = badPercent{
    _score = 0;// to be removed also _goodPercent and _badPercent
  }

  int get badPercent => _badPercent;

  set badPercent(int value) {
    _badPercent = value;
  }

  int get goodPercent => _goodPercent;

  set goodPercent(int value) {
    _goodPercent = value;
  }

  int get excellentPercent => _excellentPercent;

  set excellentPercent(int value) {
    _excellentPercent = value;
  }

  double? get score => _score;

  set score(double? value) {
    _score = value;
  }

  List<double> get coursesPercentage => _coursesPercentage;

  set coursesPercentage(List<double> value) {
    _coursesPercentage = value;
  }

  List<Course> get scoreCourses => _scoreCourses;

  set scoreCourses(List<Course> value) {
    _scoreCourses = value;
  }

  String? get scoreDescription => _scoreDescription;

  set scoreDescription(String? value) {
    _scoreDescription = value;
  }

  String get scoreName => _scoreName;

  set scoreName(String value) {
    _scoreName = value;
  }
}