import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile1 extends StatefulWidget {
  const profile1({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile1> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.green,
                    Color_Theme,
                    Color_Theme,
                    Colors.green,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                    height: 400 * 0.05,
                  ),
                ],
              ),
            ),
          ),
          Form(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                  height: 270,
                  width: 500 * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'UserID: ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            user.uid, //UserId
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400 * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            '  Email: ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            user.email!, //email
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50 * 0.5,
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
                    label: Text('Logout'),
                    onPressed: () {
                      print('Manu Logout');
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogout();
                    },
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 90);
    path.lineTo(size.width, 0);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
