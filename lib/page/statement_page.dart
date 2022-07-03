import 'package:flutter/material.dart';
import 'dart:math';

class StatementPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('What is BMi'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(50, 75, 205, 1),
    ),
    body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(


                  child: SingleChildScrollView(
                      child:Text
                        ('What is a Body-Mass-Index? '

                         '\n \nYour BMI is a number based on your height, weight and age. Each of these are divided into three categories: under 18.5, 18.5-24 and 25-29.9. For women it is considered normal to be around 18.5 and 25 for men to be over 30. A reading of over 30 is considered overweight. For example, if you are a woman and have a BMI of 24.9 then you are considered overweight.'
                         'Weight gain over the last year is common for most people in their mid-thirties. More specifically, women are at a higher risk of gaining weight than men. A study by the International Journal of Epidemiology (IJE) examined how BMI has changed from 1985-1995. The results revealed a very significant rise in weight gain amongst women aged 30 and above, and this was found to be both a cause and consequence of life events.'
                         'Drinking habits have changed dramatically over the last 20 years. More and more women are choosing to drink more wine than beer. This results in women having a higher rate of alcohol intake than men.')


                  ))),

        ]
    ),
  );
}



