import 'package:flutter/material.dart';
import 'package:order_food/Components/NavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_food/Pages/BodyOfHomePage.dart';
import 'package:order_food/Pages/order_page.dart';
import 'package:order_food/Pages/profile_page.dart';
import 'package:order_food/Pages/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName;
  int selectedIndex = 0;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  void onTapindex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List _pages = [BodyOfHomePage(), SearchPage(), OrderPage()];
  List _title = ["Home", "Search", "Order"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title.elementAt(selectedIndex),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0),
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 45.0,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
              ),
            ],
          )),
      body: _pages.elementAt(selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onTap: onTapindex,
      ),
    );
  }
}
