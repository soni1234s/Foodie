import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_food/Components/variety.dart';

class ListofVariety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.all(5.0),
          children: [
            Variety(
              image: Image(
                image: AssetImage('asset/images/asian.png'),
                height: 80.0,
                width: 60.0,
              ),
              title: 'Asian',
            ),
            Variety(
              image: Image(
                image: AssetImage('asset/images/american.png'),
                height: 80.0,
                width: 60.0,
              ),
              title: 'American',
            ),
            Variety(
              image: Image(
                image: AssetImage('asset/images/burger.png'),
                height: 80.0,
                width: 60.0,
              ),
              title: 'Burger',
            ),
            Variety(
              image: Image(
                image: AssetImage('asset/images/pizza.png'),
                height: 80.0,
                width: 60.0,
              ),
              title: 'Pizza',
            ),
            Variety(
              image: Image(
                image: AssetImage('asset/images/Sushii.png'),
                height: 80.0,
                width: 60.0,
              ),
              title: 'Sushi',
            ),
          ],
        ),
      ),
    );
  }
}
