import 'package:flutter/material.dart';
import 'package:order_food/Location/weather.dart';
import 'package:order_food/Pages/loginPage.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoactionData();
  }

  void getLoactionData() async {
    var weatherData = await WeatherModel().getLocationData();
    print(weatherData['name']);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('asset/images/logo.png'),
          height: 1000.0,
          width: 1000.0,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
