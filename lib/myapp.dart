import 'package:flutter/material.dart';
import 'package:myproject/homepage.dart';

class FarmKeep extends StatelessWidget {
  const FarmKeep({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Farm Keep',
      home: HomePage(),
    );
  }
}
