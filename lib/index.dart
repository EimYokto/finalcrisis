import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:flutter/material.dart';
import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/backend/database.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color_Theme[200],
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Image.asset(
              "asset/images/logo.png",
              width: size.width * 0.2,
              height: size.height * 0.2,
            ),
            SizedBox(
              height: size.height * 0.02,
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
            SizedBox(
              height: size.height * 0.04,
            ),
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Input your email',
                          filled: true,
                          fillColor: Color_Grey[200],
                          prefixIcon: Icon(
                            Icons.email,
                            color: pColor,
                            size: size.height * 0.05,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: 'Input your Password',
                          filled: true,
                          fillColor: Color_Grey[200],
                          prefixIcon: Icon(
                            Icons.lock,
                            color: pColor,
                            size: size.height * 0.05,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontSize: sFont,
                            ),
                            primary: pColor,
                            padding: EdgeInsets.all(15.0),
                            shape: StadiumBorder()),
                        child: Text('Login'),
                        onPressed: () {
                          formKey.currentState!.save();
                          // print("$email $password");
                          var local = LocalDB();
                          local.Login(email, password).then((value) {
                            if (value) {
                              print('success');
                              Navigator.pushNamed(context, 'dashboard');
                            } else {
                              print('fail');
                              final bar = SnackBar(
                                content: Text(
                                  'ไม่พบข้อมูล',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color_white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.red[900],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(bar);
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontSize: sFont,
                              ),
                              primary: pColor,
                              padding: EdgeInsets.all(15.0),
                              shape: StadiumBorder()),
                          icon: FaIcon(FontAwesomeIcons.sign),
                          label: Text('   SIGNUP   '),
                          onPressed: () {
                            print("สมัครสมาชิก");
                            Navigator.pushNamed(context, 'register');
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontSize: sFont,
                              ),
                              primary: Color_white,
                              onPrimary: Colors.red,
                              padding: EdgeInsets.all(15.0),
                              shape: StadiumBorder()),
                          icon: FaIcon(FontAwesomeIcons.google,
                              color: Colors.red),
                          label: Text('  google   '),
                          onPressed: () {
                            print("google");
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                            //Navigator.pushNamed(context, 'dashboard');
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
