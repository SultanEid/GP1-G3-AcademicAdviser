class StudentData {
  late String? name;
  late String? studentId;
  late String? GPA;
  late String? CH;
  late String? RH;
  late List<String>? StudentsUID = [];
  StudentData(
      {this.name,
        this.studentId,
        this.GPA,
        this.CH,
        this.RH,
        this.StudentsUID});
}
