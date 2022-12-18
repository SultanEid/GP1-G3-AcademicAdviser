import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrifeWidget extends StatelessWidget {
  BrifeWidget({Key? key}) : super(key: key);

  String brife = 'A model-driven development enthusiast. Mainly interested in conducting research on code generation and UML centric software. I have graduated from Taibah University with B.Sc degree in computer science and join the academic staff as a teacher assistant at Taibah University after then. I spent around two years as a lab TA for different courses mainly focusing on object-oriented programming. After that I started my master program in University of Ottawa and joined Cruise Lab that is being supervised by professor Timothy Lethbridge conducting research on different areas of Umple. My thesis is discussing the development of C++ code generation for Umple which generates OO C++ code from UML/Umple models. The development was approached in agile way through test-driven development. Through the development of this project I have gained more interest in several topics including: Modelling (in general), Meta-Modelling, Eclipse-based development, OO programming, Design of Domain-Specific Languages, Testing, Model Transformation M2T (Code Generation), Scenario Modelling, Requirement Engineering, Conducting Usability Experiments, Conducting Usability Evaluation with inspection methods, UML modelling, Petri-Nets modelling, agile programming, web programming and web testing.'
      '\n\nI have also developed good expertise in working with GRL models and proposed an approach to improve business using GRL and Ruby which automate the process of collecting customer reviews and propagate them back to the model using JucmNav and Ruby as main development language.'
      '\n\nCurrently, I am a Phd student at the University of Ottawa focusing my research on model-based testing and automatic tests generation in Umple/UML.';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1119.w,
      height: 438.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 1063.w,
            height: 20.h,
            child: Text(
              'Brife',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w300,
                  fontSize: 27.sp,
                  color: Color.fromARGB(255, 87, 87, 87)
              ),
            ),
          ),
          Divider(
            endIndent: 28.w,
            indent: 28.w,
          ),
          Container(
            width: 1058.w,
            height: 356.h,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              // for Vertical scrolling
              scrollDirection: Axis.vertical,
              child: Text(
                brife,
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w300,
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 112, 112, 112)
                ),
              ),
            ),
            ),
        ],
      ),
    );
  }
}
