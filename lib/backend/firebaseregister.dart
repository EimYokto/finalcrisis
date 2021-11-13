import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:finalcrisis/config/constant.dart';

class FirebaseRegister extends StatefulWidget {
  const FirebaseRegister({Key? key}) : super(key: key);

  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  var name, email, password;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 640,
                width: 411.4,
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
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        txtName(),
                        txtEmail(),
                        txtPassword(),
                        SizedBox(
                          height: 400 * 0.05,
                        ),
                        btnSubmit(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Name:',
          icon: Icon(
            Icons.person,
            color: pColor,
            size: 600 * 0.05,
          ),
          hintText: 'Input your name',
        ),
        validator: (val) {
          if (val!.length < 6) {
            return 'กรุณากรอกข้อมูลมากกว่า 6 ตัวอักษร';
          }
        },
        onSaved: (val) {
          name = val;
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Email:',
          icon: Icon(
            Icons.email,
            color: pColor,
            size: 600 * 0.05,
          ),
          hintText: 'Input your email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมลด้วย';
          } else if (!(value.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมลด้วย';
          }
        },
        onSaved: (value) {
          email = value;
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Password:',
          icon: Icon(
            Icons.lock,
            color: pColor,
            size: 600 * 0.05,
          ),
          hintText: 'Input your password',
        ),
        obscureText: true,
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget btnSubmit() {
    return Container(
      width: 400 * 0.7,
      height: 650 * 0.08,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: pColor)),
        color: pColor,
        textColor: Colors.white,
        child: Text('Submit', style: TextStyle(fontSize: 20)),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            registerFirebase();
          }
          Navigator.pushNamed(context, 'index');
        },
      ),
    );
  }

  Future<void> registerFirebase() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((response) {
        print(response);
      });
      setupProfile();
    } catch (e) {
      print(e);
      var error = '${e}';
      myAlert(error);
    }
  }

  Future<void> setupProfile() async {
    var user = FirebaseAuth.instance.currentUser!;
    await user.updateProfile(
        displayName: name,
        photoURL:
            "https://www.nicepng.com/png/full/136-1366211_group-of-10-guys-login-user-icon-png.png");
    print(user.displayName);
    //await user.updatePhotoURL("https://picsum.photos/250?image=9");
    print(user);
  }

  void myAlert(dynamic msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: ListTile(
                leading: Icon(
                  Icons.alarm_on,
                  color: Colors.red,
                  size: 48,
                ),
                title: Text(msg),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                )
              ]);
        });
  }
}
