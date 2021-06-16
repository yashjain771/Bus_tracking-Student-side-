

import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_side_bts/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  MyUser _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

 
  Stream<MyUser> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
