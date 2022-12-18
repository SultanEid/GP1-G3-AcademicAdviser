<<<<<<< Updated upstream
import 'package:academic_adviser/pages/Services/Services.dart';
=======
import 'package:academic_adviser/pages/Profile/Profile.dart';
import 'package:academic_adviser/pages/ServicesPage/Services.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SignIn/SignIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
<<<<<<< Updated upstream
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Services(),
=======
    /*
        Widget Choice;
        if(user==null){
           Choice =  SignIn();
        }else{
          Choice = Services();
        }

     */

        return Directionality(
          textDirection: TextDirection.ltr,
            child: Profile(),
>>>>>>> Stashed changes
        );
      },
    );
    ;
  }
}
