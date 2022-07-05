import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Healthy Wishlist'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(50, 75, 205, 1),
    ),
  );
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(new SqliteApp());
}


class SqliteApp extends StatefulWidget {
  const SqliteApp({Key? key}) : super(key: key);

  @override
  State<SqliteApp> createState() => _SqliteAppState();
}

class _SqliteAppState extends State<SqliteApp> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: TextField(
              controller: textController,

            )
        ),
        body: Center(
          child: FutureBuilder<List<Grocery>>(
              future: DatabaseHelper.instance.getGroceries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Grocery>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(child: Text('No Groceries in List.'))
                    : ListView(
                  children: snapshot.data!.map((grocery) {
                    return Center(
                      child: ListTile(
                        title: Text(grocery.name),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              await DatabaseHelper.instance.add(
                Grocery(name: textController.text),
              );
              setState(() {
                textController.clear();
              });
            }),
      ),
    );
  }
}


class Grocery {

  final int? id;
  final String name;

  Grocery({this.id, required this.name});

  factory Grocery.fromMap(Map<String, dynamic>json) => new Grocery(
    id: json ['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name' : name,
    };
  }
}


//Damit die Klasse nur eine Instanz hat
class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //falls die DB nicht vorhanden ist initalisiert er eine
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

//The dart:io import at the top provides support for Directory, path_provider provides support for getApplicationDocumentsDirectory and path.dart gives support for join.
//
// So _initDatabase opens the database, which is groceries.db, version 1, and if it doesn't exist we can run the _onCreate method on creation of the database. So... we need the _onCreate method now. Put it below the _initDatabase method:
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

//Erstellt die Tabelle für die Datenbank
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE groceries(
          id INTEGER PRIMARY KEY,
          name TEXT
      )
      ''');
  }

  Future<List<Grocery>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Grocery> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Grocery.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Grocery grocery) async {
    Database db = await instance.database;
    return await db.insert('groceries', grocery.toMap());
  }
}
