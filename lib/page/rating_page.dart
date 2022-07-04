import 'package:bmi/page/rating_data_model.dart';
import 'package:bmi/page/rating_details.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RatingsPage extends StatelessWidget {

  static List<String> ratings = [
    'very severely underweight',
    'Severely underweight',
    'Moderately underweight',
    'Slightly underweight',
    'Normal (healthy weight)',
    'Overweight',
    'Moderately obese(class I)',
    'Severely obese(class II)',
    'Very severely obese(class III)'
  ];

  static List url = ['https://i.pinimg.com/564x/ab/cb/a5/abcba5f7f3df157db7c20dfb84df9907.jpg',
    'https://i.pinimg.com/564x/5e/23/bd/5e23bde9b96fe8a2e22b0d72dff2216a.jpg',
    'https://i.pinimg.com/564x/83/10/c0/8310c06cdc0678e2096c48a1c6a1fd0a.jpg',
    'https://i.pinimg.com/564x/22/7d/e8/227de8cacc47507252ee3c457a13071c.jpg',
    'https://i.pinimg.com/564x/3d/94/1a/3d941ab65c3e87510ffd40d5a32137c8.jpg',
    'https://i.pinimg.com/564x/50/0e/33/500e33fa46ab02781f72c7796149e45b.jpg',
    'https://i.pinimg.com/564x/94/8f/7e/948f7ead85f37010a48405cf07ce9f04.jpg',
    'https://i.pinimg.com/564x/8c/75/31/8c7531464c16441928910323ae8ae8b1.jpg',
    'https://i.pinimg.com/564x/b1/56/02/b1560210e7495a4fd8ff3d418f1b599f.jpg',
];
  static List<String> description = [
    'Values less than 15.00.',
    'Values from 15.00 to less than 16.00.',
    'Values from 16.00 to less than 17.00.',
    'Values from 17.00 to less than 18.50.',
    'Values from 18.50 to less than 25.00.',
    'Values from 25.00 to less than 30.00.',
    'Values from 30.00 to less than 35.00.',
    'Values from 35.00 to less than 40.00.',
    'Values less than 15.00.'
  ];
  final List<RatingDataModel> Ratingdetails = List.generate(
      ratings.length,
          (index)
      => RatingDataModel(ratings[index], '${url[index]}', description[index]));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Ratings'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(50, 75, 205, 1),
    ),
    body: ListView.builder(
      itemCount: ratings.length,
        itemBuilder: (context,index){
          return Card(
          child: ListTile(
            title: Text(Ratingdetails[index].name),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(Ratingdetails[index].ImageUrl),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RatingDetail(ratingDataModel: Ratingdetails[index])));
            },
          ),
          );
        }
        )
  );
}