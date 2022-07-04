import 'package:bmi/page/rating_data_model.dart';
import 'package:flutter/material.dart';

class RatingDetail extends StatelessWidget {
  final RatingDataModel ratingDataModel;

  const RatingDetail ({Key? key, required this.ratingDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(''),),
     body: Column(
       children: [
         Image.network('src'),
         Text('desc'),
       ],
     ),
   );
  }

}