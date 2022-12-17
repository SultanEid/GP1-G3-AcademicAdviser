import 'package:firebase_auth/firebase_auth.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/Database/Database.dart';

class AuthService {
  final FirebaseAuth _Auth = FirebaseAuth.instance;
//
  //function for customize user obj from Firebaseuser

  TheUser? _CoustumUserData(User? user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser?> get user {
    return _Auth.authStateChanges().map((User? user) => _CoustumUserData(user));
  }

  //Sign In with Email and Password
  Future SignInWithEmailPassword(String Email , String Password) async{
    try {
      UserCredential SignInResult = await _Auth.signInWithEmailAndPassword(email: Email, password: Password);
      User? UserResult = SignInResult.user;
      return _CoustumUserData(UserResult);
    }catch(e){
      print(e.toString());
    }
  }

  //Sign Out
  Future SignOut() async {
    try {
      return await _Auth.signOut();
    } catch (e) {
      return print(e.toString());
    }
  }
}
