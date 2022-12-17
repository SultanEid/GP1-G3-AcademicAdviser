import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';
import 'package:academic_adviser/TestWidgets/ProfileWidget.dart';

class Profile extends StatefulWidget {
  final String UserID;
  Profile({required this.UserID});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final DatabaseVariables = Provider.of<List<DatabaseVariable>?>(context);
    DatabaseVariables?.forEach((Varibles) {
      print(Varibles.Name);
    });
    return ListView.builder(
      itemBuilder: (context, index){
        return Text("1");
      },
      itemCount: 1,
    );
  }
}

