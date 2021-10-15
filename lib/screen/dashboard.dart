import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:finalcrisis/model/activity.dart';
import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  // initState เป็น function ที่จะทำงานก่อนการ วาดหน้า
  @override
  void initState() {
    super.initState();
    callActivity();
  }

  Future<void> callActivity() async {
    // กำหนด path
    var url = Uri.parse("https://www.boredapi.com/api/activity");
    // การ call api
    var response = await http.get(url);

    // การแสดง สถานะของโค้ด
    print(response.statusCode);
    // การแสดง ข้อมูล
    print(response.body);

    // การสั่งให้แอปวาดหน้าจอใหม่ โดยการใช้ function setState
    setState(() {
      // การแปลงข้อมูลจาก json >> object
      data = cedFromJson(response.body);
      // การเข้าถึงข้อมูลใน object
      print(data.activity);
      print(data.type);
      print(data.participants);
      print(data.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Manu Package'),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('video'),
                leading: Icon(Icons.video_label),
                onTap: () {
                  print('Manu video');
                  Navigator.pushNamed(context, 'video');
                },
              ),
              ListTile(
                title: Text('image'),
                leading: Icon(Icons.image),
                onTap: () {
                  print('Manu image');
                  Navigator.pushNamed(context, 'image');
                },
              ),
              ListTile(
                title: Text('location'),
                leading: Icon(Icons.local_activity_outlined),
                onTap: () {
                  print('Manu location');
                  Navigator.pushNamed(context, 'location');
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.local_activity_outlined),
                onTap: () {
                  print('Manu Logout');
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogout();
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Dashboard'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 150,
              left: 50,
              child: Text('Eim',
                  style: TextStyle(
                    fontSize: 35,
                  )),
            ),
            Positioned(
              top: 50,
              left: 160,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            Positioned(
              top: 150,
              left: 20,
              child: Text(
                'Name:  ' + user.displayName!,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Text(
                'Email:  ' + user.email!,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),

            //Text(data?.activity ?? "กำลังโหลด"),
            //Text(data?.type ?? ""),
            // การนำ integer มาแสดง
            //Text('${data?.participants ?? ""}'),
            //Text('${data?.price ?? ""}'),
          ],
        ),
      ),
    );
  }
}
