import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/TestWidgets/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';
import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/Reusable/Buttons.dart';
import 'package:academic_adviser/TestWidgets/ProfileWidget.dart';

class HomeScreen extends StatelessWidget {
  final String UID;
  HomeScreen({required this.UID});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<DatabaseVariable>?>.value(
      value : DatabaseService().ProfileSnapshot,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
          actions: <Widget>[
            SignOutButton(context,false, () async{
              await AuthService().SignOut();
            }
            ),
          ],
        ),
        body: ProfileWidget(UID: UID,collecionName: "Profile",),
      ),
    );
  }
}

