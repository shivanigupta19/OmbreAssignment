import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: HexColor('#152238'),
        home: new Dashboard());
  }
}
