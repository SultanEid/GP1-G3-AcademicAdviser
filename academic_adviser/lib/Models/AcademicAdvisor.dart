import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Office.dart';
import 'package:academic_adviser/Models/OfficeHours.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/Models/AAAUser.dart';

class AcademicAdvisor extends AAAUser {
  late List<Student> _student;
  Office? _office;
  List<OfficeHours>? _officeHoures;
  List<Course> _planCourses = [];
  bool _theme = false;

  bool get theme => _theme;

  set theme(bool value) {
    _theme = value;
  }

  AcademicAdvisor.AcademicAdvisorProfile({
    required String firstName,
    required String lastName,
    required String academicEmail,
    required Profile profile,
    Office? office,
    List<OfficeHours>? officeHoures,
    required List<Course> planCourses,
  })  : _office = office,
        _officeHoures = officeHoures,
        super.AcademicAdvisorProfile(
        firstName: firstName,
        lastName: lastName,
        academicEmail: academicEmail,
        profile: profile,
      );

  AcademicAdvisor(
      {required String uid,
        required String firstName,
        required String lastName,
        required String academicID,
        required String academicEmail,
        required String phone,
        required Profile profile,
        required List<Student> student,
        Office? office,
        List<OfficeHours>? officeHoures,
        required List<Course> planCourses,
      })
      : _student = student,
        _office = office,
        _officeHoures = officeHoures,
        _planCourses = planCourses,
        super(
        uid: uid,
        firstName: firstName,
        lastName: lastName,
        academicID: academicID,
        academicEmail: academicEmail,
        phone: phone,
        profile: profile,
      );

  List<Student> get student => _student;

  set student(List<Student> value) {
    _student = value;
  }

  Office? get office => _office;

  set office(Office? value) {
    _office = value;
  }

  List<OfficeHours>? get officeHoures => _officeHoures;

  set officeHoures(List<OfficeHours>? value) {
    _officeHoures = value;
  }

  List<Course> get planCourses => _planCourses;

  set planCourses(List<Course> value) {
    _planCourses = value;
  }
}
