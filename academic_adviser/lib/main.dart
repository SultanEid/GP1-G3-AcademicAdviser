import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDdHgVoszZRnpgy7sJuBktS5pZNcYGwjjo',
      appId: '1:759792061333:web:5b0a688f1dd9f470a9049c',
      messagingSenderId: '759792061333',
      projectId: 'academic-advisor-assistant-db',
      authDomain: 'academic-advisor-assistant-db.firebaseapp.com',
      storageBucket: 'academic-advisor-assistant-db.appspot.com',
    ),
  );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          title: 'AAA',
          home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('S Worng!');
              } else if (snapshot.hasData) {
                return const Wrapper();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        // const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}