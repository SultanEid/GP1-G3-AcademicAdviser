import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTextField extends StatelessWidget {
  SignInTextField({Key? key, required this.labelTextPar, required this.hintTextPar, required this.obscure , }) : super(key: key);
  final String labelTextPar;
  final String hintTextPar;
  final bool obscure;
  String? textInput;
  //----------------------------
  String? val;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 360.w,
          height: 60.h,
          child: TextField(
            onChanged: (input){
              textInput = input;
            },
            decoration: InputDecoration(
              labelText: this.labelTextPar,
              hintText: this.hintTextPar,
              border: InputBorder.none,
              fillColor: Color.fromARGB(255, 112, 112, 112),
              floatingLabelStyle:
              const TextStyle(color: Colors.black),
            ),
            obscureText: obscure,
          ),
        ),
        Container(
          height: 2.h,
          width: 360.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 96, 220, 220),
                    Color.fromARGB(255, 114, 72, 185),
                  ])),
        )
      ],
    );
  }
}
