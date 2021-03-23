import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_food/Location/weather.dart';
import 'package:order_food/Pages/loadingPage.dart';

import 'package:order_food/Pages/loginPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;
  String cityname = '';
  TextEditingController nameController;
  TextEditingController locationController = TextEditingController();
  Color color = Colors.orange;
  bool isEnable = false;
  LoadingScreen load = LoadingScreen();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "${auth.currentUser.email}");
    getCityName();
  }

  void getCityName() async {
    var weatherData = await WeatherModel().getLocationData();
    setState(() {
      cityname = weatherData['name'];
      locationController = TextEditingController(text: cityname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: Text('Sign Out'),
                  onPressed: () {
                    auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
                //color: Colors.black,
                boxShadow: [
                  BoxShadow(blurRadius: 5.0, color: Colors.black),
                ], shape: BoxShape.circle),
            child: CircleAvatar(
              //backgroundColor: Colors.white,
              radius: 100.0,
              backgroundImage: ExactAssetImage('asset/images/2.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              enabled: isEnable,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 30.0,
                    color: Colors.blueGrey,
                  ),
                  hintText: "${auth.currentUser.email}",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Email"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: locationController,
              enabled: isEnable,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                    size: 30.0,
                    color: Colors.blueGrey,
                  ),
                  hintText: "${locationController.value}",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  labelText: "Your City"),
            ),
          ),
        ],
      ),
    );
  }
}
