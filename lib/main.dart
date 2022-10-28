import 'package:authentication/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Auth"),
          ),
          body: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: auth.googleSignIn,
                  icon: Icon(Icons.sign_language),
                  label: Text("Sign In with Google"))
            ],
          ),
        ),
      ),
    );
  }
}
