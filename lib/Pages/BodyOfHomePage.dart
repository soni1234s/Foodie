import 'package:flutter/material.dart';
import 'package:order_food/Components/ListofVariety.dart';
import 'package:order_food/Components/corousal.dart';

class BodyOfHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CorousalAdd().slider, ListofVariety()],
    );
  }
}
