import 'package:authentication/profile.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          await Auth().googleSignIn().then((_) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
                (route) => false);
          });
        },
        icon: Image.asset('./assets/images/google_logo.png'),
        label: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Sign in with Google',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
      ),
    );
  }
}
