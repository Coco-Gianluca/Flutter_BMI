import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.yourHistory),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(50, 75, 205, 1),
    ),
  );
}