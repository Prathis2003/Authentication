import 'package:authentication/SignInButton.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';

import 'SignIn.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Auth().googleSignOut().then((_) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInButton()),
            (route) => false));
      },
      icon: Icon(
        Icons.exit_to_app,
        color: Colors.grey,
      ),
      label: Text(
        "Sign out",
        style: TextStyle(color: Colors.grey),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.white),
    );
  }
}
