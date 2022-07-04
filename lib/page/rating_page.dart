import 'package:bmi/page/rating_data_model.dart';
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
    'Moderately overweight',
    'Moderately obese(class I)',
    'Severely obese(class II)',
    'Very severely obese(class III)'
  ];

  static List url = ['https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
];
  final List<RatingDataModel> Ratingdetails = List.generate(
      ratings.length,
          (index)
      => RatingDataModel('${ratings[index]}', '${url[index]}', '${ratings[index]}'));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Rating'),
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
              print('tapped');
            },

          ),
          );
        }
        )

    /*body: ListView(
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
    ),*/
  );
}