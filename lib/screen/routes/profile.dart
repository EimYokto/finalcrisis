import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color_Theme,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.account_circle, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('Profile'),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 400 * 0.04,
            ),
            Column(
              children: [
                CircleAvatar(
                  minRadius: 39,
                  maxRadius: 54,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                Text(
                  user.displayName!,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: 400 * 0.02,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
                  child: Card(
                    elevation: 15,
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 400 * 0.9,
                          ),
                          Container(
                            width: 400 * 0.8,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: sFont,
                                ),
                                primary: Color_white,
                                onPrimary: Colors.red,
                                padding: EdgeInsets.all(15.0),
                              ),
                              icon: Icon(Icons.logout, color: Colors.red),
                              label:
                                  Text('Logout                             '),
                              onPressed: () {
                                print('Manu Logout');
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogout();
                              },
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
