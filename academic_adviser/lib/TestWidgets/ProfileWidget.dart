import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/TestWidgets/TestProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({required this.UID ,required this.collecionName });
     String UID;
     String collecionName;

  //final DatabaseVariable Profilelistindex;
 // ProfileWidget({required this.Profilelistindex});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(collecionName);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(UID).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
         String ID = Text("${data['ID']}").data.toString();
         String Name = Text("${data['Name']}").data.toString();
          return TestProfile(ID: ID, Name: Name);
        }

        return Text("loading");
      },
    );
  }
}
