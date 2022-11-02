import 'package:authentication/profile.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await Auth().googleSignIn().then((_) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
              (route) => false);
        });
      },
      //icon: Image.asset('./assets/images/google_logo.png'),
      child: Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
    );
  }
}
