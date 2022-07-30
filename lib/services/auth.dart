import 'package:firebase_auth/firebase_auth.dart';

import '../models/mylilbro.dart';

class AuthenticationController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  //create MyAppUser from a Firebase User
  // ignore: missing_return
  MyAppUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? MyAppUser(
            uid: user.uid,
            email: user.email,
            name: user.displayName,
          )
        : null;
  }

  //registering user
  Future<String?> registerUserWithEmailandPassword(
      String email, String password, String name) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
    } on FirebaseAuthException catch (error) {
      print(error.code);
      return error.message;
    }
  }

  Future<String?> loginUserWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print(error.code);
      return error.message;
    }
  }

  Future signoutUser() async {
    try {
      await _auth.signOut();
      print('Signed out');
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  User? get currentUser => _auth.currentUser;
}
