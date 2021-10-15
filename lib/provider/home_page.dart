import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/screen/dashboard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("googleLogin0");
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              print("googleLogin1");
              return Dashboard();
            } else if (snapshot.hasError) {
              print("googleLogin3");
              return Center(child: Text('Something Went Wrong!'));
            } else {
              print("googleLogin3");
              return Index();
            }
          }),
    );
  }
}
