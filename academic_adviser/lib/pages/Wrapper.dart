import 'package:academic_adviser/Models/AAAUser.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/StudentView/ServicesPage/Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Models/AcademicAdvisor.dart';
import '../Models/Alert.dart';
import '../Models/Appointment.dart';
import '../Models/Attendance.dart';
import '../Models/Certificate.dart';
import '../Models/Course.dart';
import '../Models/Note.dart';
import '../Models/Office.dart';
import '../Models/OfficeHours.dart';
import '../Models/Profile.dart';
import '../Models/Score.dart';
import '../Models/Student.dart';
import 'SignIn/SignIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AAAUser?>(context);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Widget Choice;
        if(user==null){
           Choice =  SignIn();
        }else{
          Choice = Services();
        }
        return Directionality(
          textDirection: TextDirection.ltr,
            child: StudentServices(),
        );
      },
    );
  }
}
