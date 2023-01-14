class Note {
  late String _noteID;
  late String _receiver;
  late String _noteContent;
  bool? _noteState = true;

  Note({required String noteID, required String receiver, required String  noteContent, bool? noteState})
      : _noteID = noteID,
        _receiver = receiver,
        _noteContent = noteContent,
        _noteState = noteState;

  bool? get noteState => _noteState;

  set noteState(bool? value) {
    _noteState = value;
  }

  String get noteContent => _noteContent;

  set noteContent(String value) {
    _noteContent = value;
  }

  String get receiver => _receiver;

  set receiver(String value) {
    _receiver = value;
  }

  String get noteID => _noteID;

  set noteID(String value) {
    _noteID = value;
  }
}
