
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/SignIn/SignInWidgets/SignInCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BackgroundWidget(),
            SignInCard(),
          ],
        ),
      ),
    );
  }
}

