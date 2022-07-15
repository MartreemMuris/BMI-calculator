import 'dart:math';

import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final bool isMale;
  final double height;
  final int weight;
  final int age;
  late int result;

  BmiResult({
    Key? key,
    required this.isMale,
    required this.weight,
    required this.age,
    required this.height,
  }) : super(key: key) {
    result = (weight / pow(height / 100, 2)).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI RESULT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getText('GENDER : ${isMale? 'Male' : 'Female'}'),
            getText('WEIGHT : $weight KG'),
            getText('AGE : $age years'),
            getText('HEIGHT : ${height.round()} CM'),
            getText('Result : $result'),
            
          ],
        ),
      ),
    );
  }

  getText(String value) {
    return Text(
      value,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
