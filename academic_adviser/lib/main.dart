import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(MyApp());


}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          title: 'AAA',
          home: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('S Worng!');
              } else {
                return const Wrapper();
              }
            },
          )
        // const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}