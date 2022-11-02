import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SignIn.dart';

class Auth {
  final firebaseAuth = FirebaseAuth.instance;
  Future googleSignIn() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final result = await firebaseAuth.signInWithCredential(credential);
    final user = result.user;
    final prefs = await SharedPreferences.getInstance();
    SignInPage.photoUrl = user!.photoURL;
    SignInPage.userDisplayName = user.displayName;
    SignInPage.userEmail = user.email;

    prefs.setBool('userLoggedIn', true);
    prefs.setString('uid', user.email as String);
    prefs.setString('displayName', user.displayName as String);
    prefs.setString('photoUrl', user.photoURL as String);
    print(prefs.get('uid'));
  }

  Future googleSignOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userLoggedIn');
    prefs.remove('uid');
    prefs.remove('displayName');
    prefs.remove('photoUrl');
    await firebaseAuth.signOut().then((_) {
      GoogleSignIn().signOut();
    });
    print(prefs.get('uid'));
  }
}
