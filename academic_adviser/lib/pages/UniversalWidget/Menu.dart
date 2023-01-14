import 'package:academic_adviser/pages/UniversalWidget/MenuButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/Score.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 513.w,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28.h,),
            Container(
              width: 172.w,
              height: 48.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Logos/LogoWithoutStrapline.png',
                    ),
                    fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(height: 36.5.h,),
            Divider(
              color: Color.fromARGB(255, 162, 162, 162),
              thickness: 1.5,
              indent: 56.5.w,
              endIndent: 56.5.w,
            ),
            // SizedBox(height: 23.5.h,),
            // MenuButton(buttonLabel:"Services",icon: Icons.view_list_rounded, route: null),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Profile",icon: Icons.person,route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Dashboard",icon: Icons.dashboard, route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Chat",icon: Icons.chat, route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Students' List",icon: Icons.list, route: StudentsList()),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Recommend Courses",icon: Icons.collections_bookmark, route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Scores",icon: Icons.stacked_line_chart, route: Scores()),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Notes",icon: Icons.edit_note_outlined, route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),
            // MenuButton(buttonLabel:"Report",icon: Icons.library_books_outlined, route: Profile(uid: FirebaseAuth.instance.currentUser?.uid)),
            // SizedBox(height: 21.h,),

          ],
        ),
      ),
    );
  }
}
