import 'package:academic_adviser/pages/SignIn/SignInWidgets/SignInTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInInputSection extends StatelessWidget {
  const SignInInputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 588.w,
      height: 590.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontWeight: FontWeight.w900,
                fontFamily: 'Tajawal'),
          ),
          SizedBox(
            height: 30.h,
          ),
          SignInTextField(labelTextPar: 'Email Address',hintTextPar: 'name@examble.com',),
          SizedBox(
            height: 35.h,
          ),
          SignInTextField(labelTextPar: 'Password',hintTextPar: 'password',),
          Container(
            width: 360.w,
            height: 60.h,
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'need help?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Tajawal',
                    color: Color.fromARGB(255, 114, 72, 185),
                    decoration: TextDecoration.underline,
                    decorationThickness: 10.w,
                    decorationColor:
                    Color.fromARGB(255, 114, 72, 185),
                  ),
                )),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 360.w,
            height: 42.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 96, 220, 220),
                      Color.fromARGB(255, 114, 72, 185)
                    ])),
            child: SizedBox(
              width: 360.w,
              height: 42.h,
              child: TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Stack(
                    children: [

                      Container(
                        width: 360.w,
                        height: 42.h,
                        alignment: Alignment.center,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Tajawal'),
                        ),
                      ),
                      Container(
                        width: 360.w,
                        height: 42.h,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,),
                      )
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
