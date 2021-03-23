import 'package:flutter/material.dart';

class Variety extends StatelessWidget {
  final Image image;
  final String title;

  Variety({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white,
            child: FlatButton(
                onPressed: () {},
                child: Center(
                  child: image,
                )),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style:
              TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
