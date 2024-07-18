import 'package:flutter/material.dart';

const text1 = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
const text2 = TextStyle(
  color: Colors.black,
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
);
const text3 = TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

class DataContainer extends StatelessWidget {
  DataContainer({required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Colors.black,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: text1,
        )
      ],
    );
  }
}
