import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Profile/Profile.dart';
import 'package:academic_adviser/pages/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/StudentList/StudentsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'SignIn/SignIn.dart';
//import 'package:academic_adviser/pages/ServicesPage/Services.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Widget Choice;
        if(user==null){
           Choice =  SignIn();
        }else{
          Choice = Services(uid: user?.uid ,collecionName: "Profile",);
        }
        return Directionality(
          textDirection: TextDirection.ltr,
            child: Choice,
        );
      },
    );
  }
}
