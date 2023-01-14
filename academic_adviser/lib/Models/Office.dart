class Office {
  late String _building;
  late int _floor;
  late int _officeNumber;

  Office({required String building,required int floor,required int officeNumber})
      : _building = building,
        _floor = floor,
        _officeNumber = officeNumber;

  int get officeNumber => _officeNumber;

  set officeNumber(int value) {
    _officeNumber = value;
  }

  int get floor => _floor;

  set floor(int value) {
    _floor = value;
  }

  String get building => _building;

  set building(String value) {
    _building = value;
  }
}
