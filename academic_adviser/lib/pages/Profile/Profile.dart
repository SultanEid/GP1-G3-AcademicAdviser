import 'package:academic_adviser/Models/Certificate.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/Profile/ProfileWidget/CertificatesWidget.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Database/Database.dart';
import 'ProfileWidget/ProfileWidget.dart';


class Profile extends StatelessWidget {
   Profile({Key? key ,required this.uid}) : super(key: key);
   String? uid;
  late String ProfileInfoBrief;
  TheUser User = TheUser();
  @override
  Widget build(BuildContext context) {
    User.uid=uid;
    CollectionReference ProfileData = FirebaseFirestore.instance.collection("Profile").doc(User.uid).collection("ProfileInfo");
    return StreamProvider<List<Certificate>?>.value(
      value: DatabaseService(uid: User.uid).CertificateData,
      initialData: null,
      builder: (context, snapshot) {
        return FutureBuilder<DocumentSnapshot>(
          future: ProfileData.doc("ProfileBrief").get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              User.ProfileBrief = Text("${data['Brief']}").data.toString();
            }

            return ScaffoldPlus(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h,),
                      ProfileWidget(user: User,),
                      SizedBox(height: 15.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CertificatesWidget(),
                          SizedBox(width: 15.w,),
                          BrifeWidget(brief : User.ProfileBrief),
                        ],
                      ),
                    ],
                  ),
                ]
              );
          }
        );
      }
    );
  }
}
