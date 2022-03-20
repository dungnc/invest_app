import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static const _databaseVersion = 1;
  static const _databaseName = 'DieuTraCaThe.db';

  // only have a single app-wide reference to the database
  static Database? _database;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasePath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _createTable);
  }

  // get path location database
  Future<String> getDatabasePath() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    return path;
  }

  //delete
  Future deleteDB() async {
    // Delete the database
    await deleteDatabase(await getDatabasePath());
  }

  // close
  Future closeDB() async {
    // Close the database
    await _database?.close();
  }

  Future _createTable(Database db, int databaseVersion) async {
    log('onCreated table');
    // todo: create table when start app if not exist db
  }
}
