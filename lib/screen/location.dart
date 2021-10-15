import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  dynamic latitude = '';
  dynamic longitude = '';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var address = await placemarkFromCoordinates(13.736717, 100.523186);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    print(location);
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ละติจูด' + latitude,
              style: TextStyle(fontSize: 28),
            ),
            Text(
              'ละติจูด' + longitude,
              style: TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
