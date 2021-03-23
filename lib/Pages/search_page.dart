import 'package:flutter/material.dart';

import 'package:order_food/Pages/home_page.dart';
import 'package:order_food/Pages/order_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 1;
  TextEditingController controller = TextEditingController();
  void onTapindex(int index) {
    selectedIndex = index;

    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OrderPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.search,
          size: 40.0,
          color: Colors.green[200],
        ),
        title: TextField(
          autocorrect: true,
          controller: controller,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
