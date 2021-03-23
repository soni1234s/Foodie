import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CorousalAdd {
  final Widget slider = CarouselSlider(
    options: CarouselOptions(
      height: 400,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 1000),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [BoxShadow(blurRadius: 4.0)]),
              child: Image(
                image: AssetImage('asset/images/food$i.png'),
                height: 500.0,
              ));
        },
      );
    }).toList(),
  );
}
