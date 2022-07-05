import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';




void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(new SqliteApp());
}

class SqliteApp extends StatefulWidget {
  const SqliteApp({Key? key}) : super(key: key);

  @override
  _SqliteAppState createState() => _SqliteAppState();
}

class _SqliteAppState extends State<SqliteApp> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Wish>>(
              future: DatabaseHelper.instance.getWishes(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Wish>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(child: Text(
                        ':('
                      )
                    )
                    : ListView(
                  children: snapshot.data!.map((wish) {
                    return Center(
                      child: Card(
                        color: selectedId == wish.id
                            ? Colors.white70
                            : Colors.white,
                        child: ListTile(
                          title: Text(wish.name),
                          onTap: () {
                            setState(() {
                              if (selectedId == null) {
                                textController.text = wish.name;
                                selectedId = wish.id;
                              } else {
                                textController.text = '';
                                selectedId = null;
                              }
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              DatabaseHelper.instance.remove(wish.id!);
                            });
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            selectedId != null
                ? await DatabaseHelper.instance.update(
              Wish(id: selectedId, name: textController.text),
            )
                : await DatabaseHelper.instance.add(
              Wish(name: textController.text),
            );
            setState(() {
              textController.clear();
              selectedId = null;
            });
          },
        ),
      ),
    );
  }
}

class Wish {
  final int? id;
  final String name;

  Wish({this.id, required this.name});

  factory Wish.fromMap(Map<String, dynamic> json) => new Wish(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE groceries(
          id INTEGER PRIMARY KEY,
          name TEXT
      )
      ''');
  }

  Future<List<Wish>> getWishes() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Wish> wishList = groceries.isNotEmpty
        ? groceries.map((c) => Wish.fromMap(c)).toList()
        : [];
    return wishList;
  }

  Future<int> add(Wish wish) async {
    Database db = await instance.database;
    return await db.insert('groceries', wish.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Wish wish) async {
    Database db = await instance.database;
    return await db.update('groceries', wish.toMap(),
        where: "id = ?", whereArgs: [wish.id]);
  }


}
