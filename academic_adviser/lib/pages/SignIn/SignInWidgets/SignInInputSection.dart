import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignInInputSection extends StatefulWidget{
  SignInInputSection({Key? key}) : super(key: key);

  @override
  State<SignInInputSection> createState() => _SignInInputSection();
}

class _SignInInputSection extends State<SignInInputSection> {
  _SignInInputSection({Key? key});
  bool loading =false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late ThemeConfig themeConfig;
  //=========================
  String? email;
  String? emailError;
  //=========================
  bool isObscureText = true;
  String? passwordError;
  String? password;
  //=========================
  String databaseError = '';

  @override
  Widget build(BuildContext context) {
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    return Form(
      key: _key,
      child: Container(
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
            Column(
              children: [
                SizedBox(
                  width: 360.w,
                  height: 60.h,
                  child: TextFormField(
                    validator: (String? validateEmail){
                      if(validateEmail == null || validateEmail.isEmpty){
                          emailError = 'Email address is required!';
                      }else{
                        RegExp regex = RegExp(r'\w+@\w+\.\w+');
                        if (!regex.hasMatch(validateEmail!)) {
                          emailError = 'Invalid E-mail Address format!';
                        }else{
                          emailError = null;
                          validateEmail = '';
                        }
                      }


                      setState(() {});
                      return null;
                    },
                    onChanged: (input){
                      email = input;
                    },
                    cursorColor: themeConfig.primaryColor,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'name@examble.com',
                      border: InputBorder.none,
                      fillColor: Color.fromARGB(255, 112, 112, 112),
                      floatingLabelStyle: TextStyle(color: themeConfig.primaryColor,),
                    ),
                  ),
                ),
                Container(
                  height: 2.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: emailError == null || emailError!.isEmpty? themeConfig.primaryGradientColor:[Colors.red,Colors.red])),
                ),
                Container(width: 360.w,height: 30.h,alignment: Alignment.centerLeft,child: Text(emailError == null || emailError!.isEmpty? '':emailError!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Tajawal",
                    color: Colors.red),
                ),),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: [
                SizedBox(
                  width: 360.w,
                  height: 60.h,
                  child: TextFormField(
                    validator: (String? validatePassword){
                      if(validatePassword == null || validatePassword.isEmpty){
                          passwordError = 'password is required!';
                      }else{
                          passwordError = null;
                      }

                      setState(() {

                      });
                      return null;
                    },
                    onChanged: (input){
                      password = input;
                    },

                    cursorColor: themeConfig.primaryColor,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'password',
                      border: InputBorder.none,
                      fillColor: themeConfig.primaryColor,
                      suffixIcon: GestureDetector(onTap: (){
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                        child: Icon(
                            isObscureText? Icons.visibility: Icons.visibility_off,color: themeConfig.primaryColor,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(color: themeConfig.primaryColor),
                    ),
                    obscureText: isObscureText,
                  ),
                ),
                Container(
                  height: 2.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: passwordError == null || passwordError!.isEmpty? themeConfig.primaryGradientColor: [Colors.red,Colors.red])),
                ),
                Container(width: 360.w,height: 30.h,alignment: Alignment.centerLeft,child: Text(passwordError == null || passwordError!.isEmpty? '' :passwordError!,style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Tajawal",
                    color: Colors.red),),),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(width: 360.w,height: 80.h,alignment: Alignment.centerLeft,child:
            Text(databaseError == null || databaseError!.isEmpty? '' :databaseError!,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Tajawal",
                color: Colors.red),
            ),),
            Container(
              width: 360.w,
              height: 42.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: themeConfig.primaryGradientColor)),
              child: SizedBox(
                width: 360.w,
                height: 42.h,
                child: TextButton(
                    onPressed: () async {
                      _key.currentState!.validate();
                      databaseError = '';
                      if((emailError == null || emailError!.isEmpty) && (passwordError == null || passwordError!.isEmpty)){
                          await AuthService().SignInWithEmailPassword(email!,password!);
                          databaseError = 'The email address or password is incorrect! Please retry with valid account.';
                        setState(() {});
                      }
                    },
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
      ),
    );
  }
}