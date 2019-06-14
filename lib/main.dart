import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(Bmi());

class Bmi extends StatelessWidget {
  final appTitle = "BMI";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent.shade700,
          centerTitle: true,
          title: Text(appTitle),
        ),
        body: Home(),
      ),
    );
  }
}