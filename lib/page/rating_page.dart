import 'package:flutter/material.dart';
import 'dart:math';

class RatingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Rating'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: ListView(
      children: const <Widget>[
        ListTile(
          title: Text('very severely underweight'),
        ),
        ListTile(
          title: Text('Severely underweight'),
        ),
        ListTile(
          title: Text('Moderately underweight'),
        ),
        ListTile(
          title: Text('Slightly underweight'),
        ),
        ListTile(
          title: Text('Normal (healthy weight)'),
        ),
        ListTile(
          title: Text('Overweight'),
        ),
        ListTile(
          title: Text('Moderately overweight'),
        ),
        ListTile(
          title: Text('Moderately obese(class I)'),
        ),

        ListTile(
          title: Text('Severely obese(class II)'),
        ),
        ListTile(
          title: Text('Very severely obese(class III)'),
        ),

      ],
    ),
  );
}