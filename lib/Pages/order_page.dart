import 'package:flutter/material.dart';

import 'package:order_food/Pages/home_page.dart';
import 'package:order_food/Pages/search_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 2;
  TextEditingController controller = TextEditingController();
  void onTapindex(int index) {
    selectedIndex = index;

    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SearchPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
