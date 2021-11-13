import 'package:finalcrisis/home.dart';
import 'package:finalcrisis/provider/google_sing_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var email, password;
  final formKey = GlobalKey<FormState>();
  Future<void> checkUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print("success");
        // การสั่งให้มันเปลี่ยนไปหน้าใหม่
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Dashboard());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print(onError);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color_Theme,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color_Theme,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "asset/images/logo.png",
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                  ),
                  Text(
                    "Smart Heal",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: TextFormField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: pColor,
                                  size: size.height * 0.05,
                                ),
                                hintText: "Email",
                              ),
                              onSaved: (value) {
                                email = value!.trim();
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: TextFormField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: pColor,
                                  size: size.height * 0.05,
                                ),
                                hintText: "Password",
                              ),
                              onSaved: (value) {
                                password = value!.trim();
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.08,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: pColor)),
                              onPressed: () {
                                formKey.currentState!.save();
                                print("login1");
                                print("$email $password");
                                checkUser();
                              },
                              color: pColor,
                              textColor: Colors.white,
                              child: Text("login".toUpperCase(),
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: new LinearGradient(
                                        colors: [
                                          Colors.white10,
                                          Colors.black,
                                        ],
                                        begin: const FractionalOffset(0.0, 0.0),
                                        end: const FractionalOffset(0.3, 0.3),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  width: 150.0,
                                  height: 1.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 20.0,
                                        fontFamily: "WorkSansMedium"),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: new LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.white10,
                                        ],
                                        begin: const FractionalOffset(0.0, 0.0),
                                        end: const FractionalOffset(2.0, 2.0),
                                        stops: [0.0, 2.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  width: 150.0,
                                  height: 1.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.08,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: pColor)),
                              child: Text('SIGN UP',
                                  style: TextStyle(fontSize: 20)),
                              color: pColor,
                              textColor: Colors.white,
                              onPressed: () {
                                print("สมัครสมาชิก");
                                Navigator.pushNamed(context, 'register');
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontSize: sFont,
                                  ),
                                  primary: Color_white,
                                  onPrimary: Colors.red,
                                  padding: EdgeInsets.all(7.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.white)),
                                ),
                                icon: Image.asset(
                                  'asset/images/btn_google_dark_normal_mdpi.9.png',
                                  height: 48.0,
                                ),
                                label: Text('google   '),
                                onPressed: () async {
                                  print("google");
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  await provider.googleLogin();
                                  await Navigator.pushNamed(
                                      context, 'dashboard');
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
