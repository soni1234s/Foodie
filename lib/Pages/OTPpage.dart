import 'package:flutter/material.dart';

class OTPpage extends StatelessWidget {
  String mobile;
  OTPpage({this.mobile});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [TextField(), TextField(), TextField(), TextField()],
      ),
    );
  }
}
