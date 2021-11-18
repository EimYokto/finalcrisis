import 'package:finalcrisis/config/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class chat3 extends StatefulWidget {
  const chat3({Key? key}) : super(key: key);
  @override
  _chat3State createState() => _chat3State();
}

class _chat3State extends State<chat3> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('user');
  final user = FirebaseAuth.instance.currentUser!;
  String? message;
  final formKey = GlobalKey<FormState>();

  Future<void> creatData() async {
    dbfirebase
        .push()
        .set({'name': user.displayName!, 'message': message})
        .then((value) => print("success"))
        .catchError((onError) {
          print(onError);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat App',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Scaffold(
          body: Container(
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
                Flexible(
                  child: FirebaseAnimatedList(
                    query: dbfirebase,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Container(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.nicepng.com/png/full/136-1366211_group-of-10-guys-login-user-icon-png.png"),
                              ),
                              title: Text('${snapshot.value['name']}'),
                              subtitle: Row(
                                children: [
                                  Text('${snapshot.value['message']}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณาใส่ข้อมูลด้วย';
                        } else if (value.length < 2) {
                          return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
                        }
                      },
                      onSaved: (value) {
                        message = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isCollapsed: false,
                        suffixIcon: FlatButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print(message);
                              creatData();
                              formKey.currentState!.reset();
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.green,
                            size: 24.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400 * 0.19,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
