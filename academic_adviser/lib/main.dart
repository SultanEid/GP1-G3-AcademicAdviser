import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:academic_adviser/Models/AAAUser.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyApp();

}
class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AAAUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: ThemeConfig(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'AAA',
            scrollBehavior: AppScrollBehavior(),
            home: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('You have an error! ${snapshot.error.toString()}');
                  return Text('S Worng!');
                } else {
                  return Wrapper();
                }
              },
            )
        ),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}