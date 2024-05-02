import 'package:expense_app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDbHelper{
  // 2 tables (user, expense)
  // 3 tables (user, expense, category)
  MyDbHelper._();
  static final MyDbHelper db = MyDbHelper._();

  static final String User_Table = "UserModel";
  static final String Column_User_Id = "uId";
  static final String Column_User_Name = "uName";
  static final String Column_User_Email = "uEmail";
  static final String Column_User_MobNo = "uMobNo";
  static final String Column_User_Password = "uPassword";


  // static final String Table_Name_User = "UserModel";
  // static final String Column_User_Id = "uId";
  // static final String Column_User_Name = "uName";
  // static final String Column_User_Email = "uEmail";
  // static final String Column_User_MobNo = "uMobNo";
  // static final String Column_User_ = "uPassword";


  Database? myDB;

  Future<Database> getDb() async {
    if(myDB != null){
      return myDB!;
    } else {
      var db = await initDB();
      return db;
    }
  }
  Future<Database> initDB() async{
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "expenseApp.db");

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE $User_Table ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT UNIQUE, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
      // db.execute('CREATE TABLE $Table_Name_User ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
      // db.execute('CREATE TABLE $Table_Name_User ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
      // db.execute('CREATE TABLE $Table_Name_User ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
    });
  }

  // Create a user 
  Future<bool> addUser({required UserModel newUser}) async{
    var db = await getDb();

    int count = await db.insert(User_Table, newUser.toMap());

    return count > 0;
  }
}