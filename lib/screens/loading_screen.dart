import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final Location location = Location();

  void getLocation() async {
    await location.getCurrentLocation();
    print('latitude : ${location.latitude}');
    print('longitude : ${location.longitude}');
    await location.getData();
    print('data : ${location.response.body}');
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
