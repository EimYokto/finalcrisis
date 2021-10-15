import 'package:flutter/material.dart';
import 'package:finalcrisis/backend/database.dart';
import 'package:finalcrisis/config/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, password;
  final formkey = GlobalKey<FormState>();

  get color => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Container(
          color: Color_Theme,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  sizedBox(),
                  images(),
                  sizedBox(),
                  texts(),
                  txtName(),
                  //txtSurname(),
                  txtEmail(),
                  txtPassword(),
                  sizedBox(),
                  btnSubmit(),
                  sizedBox(),
                  sizedBox(),
                  sizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget images() {
    return Container(
      child: Image.asset(
        "asset/images/logo.png",
        width: 400 * 0.3,
        height: 400 * 0.3,
      ),
    );
  }

  Widget texts() {
    return Container(
      child: Text(
        'Smart Heal',
        style: TextStyle(
          fontSize: 35,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Name:',
          hintText: 'Input your surname',
          filled: true,
          fillColor: Color_Grey[200],
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.account_circle, color: pColor),
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

  Widget txtSurname() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Surname:',
          hintText: 'Input your surname',
          filled: true,
          fillColor: Color_Grey[200],
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.supervised_user_circle, color: pColor),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (value.length < 3) {
            return 'กรุณากรอกข้อมูลมากกว่า 3 ตัว';
          }
        },
        onSaved: (value) {
          surname = value!.trim();
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Email:',
          hintText: 'Input your email',
          filled: true,
          fillColor: Color_Grey[200],
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email, color: pColor),
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
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Password:',
          hintText: 'Input your password',
          filled: true,
          fillColor: Color_Grey[200],
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.lock, color: pColor),
        ),
        obscureText: true,
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget sizedBox() {
    return Container(
      child: Text(
        '        ',
      ),
    );
  }

  Widget btnSubmit() {
    return Container(
      width: 400 * 0.8,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: sFont,
            ),
            primary: pColor,
            onPrimary: Color_white,
            padding: EdgeInsets.all(15.0),
            shape: StadiumBorder()),
        icon: FaIcon(Icons.save_alt, color: Color_white),
        label: Text('  apply     '),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            var local = LocalDB();
            local.Register(
                name,
                /*surname,*/
                email,
                password);
            Navigator.pushNamed(context, 'index');
          }
        },
      ),
    );
  }
}
