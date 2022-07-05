import 'package:bmi/page/rating_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class RatingDetail extends StatelessWidget {
  final RatingDataModel ratingDataModel;

  const RatingDetail ({Key? key, required this.ratingDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(AppLocalizations.of(context)!.ratingsDetails),),
     body: Column(
       children: [
         Image.network(ratingDataModel.ImageUrl),
         SizedBox(
           height: 25,
         ),
         Text(
             ratingDataModel.desc,
           style: TextStyle(
             fontSize: 25,
           ),
         ),
       ],
     ),
   );
  }

}