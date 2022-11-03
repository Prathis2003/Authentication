import 'package:authentication/SignInButton.dart';
import 'package:authentication/profile.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String? userEmail;
  static String? userDisplayName;
  static String? photoUrl;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isUserLoggedIn = false;

  void checkUserCurrentlyLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userLoggedIn') &&
        prefs.getBool('userLoggedIn') == true) {
      SignInPage.userEmail = prefs.getString('uid');
      SignInPage.userDisplayName = prefs.getString('displayName');
      SignInPage.photoUrl = prefs.getString('photoUrl');
      isUserLoggedIn = true;
    } else {
      isUserLoggedIn = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    // Auth().googleSignOut();
    super.initState();
    checkUserCurrentlyLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return isUserLoggedIn ? ProfilePage() : SignInButton();
  }
}
