import 'package:flutter/material.dart';

class Appointment {
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  late int _day;
  late String _classRoom;
  late String _Building;

  Appointment(
      {required TimeOfDay startTime,
        required TimeOfDay endTime,
        required int day,
        required String classRoom,
        required String Building})
      : _startTime = startTime,
        _endTime = endTime,
        _day = day,
        _classRoom = classRoom,
        _Building = Building;

  String get Building => _Building;

  set Building(String value) {
    _Building = value;
  }

  String get classRoom => _classRoom;

  set classRoom(String value) {
    _classRoom = value;
  }

  int get day => _day;

  set day(int value) {
    _day = value;
  }

  TimeOfDay get endTime => _endTime;

  set endTime(TimeOfDay value) {
    _endTime = value;
  }

  TimeOfDay get startTime => _startTime;

  set startTime(TimeOfDay value) {
    _startTime = value;
  }
}