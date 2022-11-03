import 'package:authentication/services/auth.dart';
import 'package:authentication/signOutButton.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'SignIn.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(SignInPage.photoUrl.toString()),
                radius: 60,
              ),
              Text(SignInPage.userDisplayName.toString()),
              Text("Email :" + SignInPage.userEmail.toString()),
              SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
