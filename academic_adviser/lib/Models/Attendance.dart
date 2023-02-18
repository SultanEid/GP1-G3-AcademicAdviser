class Attendance {
  double _absent = 0;
  double _absentsPercentage = 0;
  double _attendance = 0;
  late int _numberOfLecture;

  Attendance({
        required double absent,
        required double attendance,
        required int numberOfLecture
  }): _absent = absent,
        _attendance = attendance,
        _numberOfLecture = numberOfLecture
  {
    _absentsPercentage = 0;// to be removed
  }

  int get numberOfLecture => _numberOfLecture;

  set numberOfLecture(int value) {
    _numberOfLecture = value;
  }

  double get attendance => _attendance;

  set attendance(double value) {
    _attendance = value;
  }

  double get absentsPercentage => _absentsPercentage;

  set absentsPercentage(double value) {
    _absentsPercentage = value;
  }

  double get absent => _absent;

  set absent(double value) {
    _absent = value;
  }
}