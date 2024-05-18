import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/models/user_model.dart';
import 'package:expense_app/presentation/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class MyDbHelper{

  MyDbHelper._();
  static final MyDbHelper db = MyDbHelper._();
  
  // USER TABLE
  static final String User_Table = "UserModel";
  static final String Column_User_Id = "uId";
  static final String Column_User_Name = "uName";
  static final String Column_User_Email = "uEmail";
  static final String Column_User_MobNo = "uMobNo";
  static final String Column_User_Password = "uPassword";

  // EXPENSE TABLE
  static final String Expense_Table = "UserModel";
  static final String Column_Expense_Id = "eId";
  static final String Column_Expense_Title = "eTitle";
  static final String Column_Expense_Desc = "eDesc";
  static final String Column_Expense_Time = "eTime";
  static final String Column_Expense_Amount = "eAmount";
  static final String Column_Expense_Balance = "eBalance";
  static final String Column_Expense_Type = "eType";
  static final String Column_Expense_CategoryId = "eCatId";
  static final String Column_Expense_UId = "uId";

  // CATEGORY TABLE
  static final String Category_Table = "CategoryModel";
  static final String Column_Category_Id = "cId";
  static final String Column_Category_Image = "cImg";
  static final String Column_Category_Name = "cName";

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
    print(dbPath);
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE $User_Table ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT UNIQUE, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
      db.execute('CREATE TABLE $Expense_Table ($Column_Expense_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_Expense_Title TEXT, $Column_Expense_CategoryId integer, $Column_Expense_UId integer, $Column_Expense_Desc TEXT, $Column_Expense_Time TEXT, $Column_Expense_Balance TEXT, $Column_Expense_Amount TEXT, $Column_Expense_Type TEXT)');
      // db.execute('CREATE TABLE $Table_Name_User ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
      // db.execute('CREATE TABLE $Table_Name_User ($Column_User_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_User_Name TEXT, $Column_User_Email TEXT, $Column_User_MobNo TEXT, $Column_User_Password TEXT)');
    });
  }

  // Create user 
  // user SIGN UP
  Future<bool> addNewUser({required UserModel newUser}) async{
    var db = await getDb();
    bool accCreated = false;
    bool haveAccount = await checkIfEmailAlreadyExists(newUser.uEmail);
    if(!haveAccount){
      int rowsAffected = await db.insert(User_Table, newUser.toMap());
      accCreated = rowsAffected > 0;
    }
    return accCreated;
  }

  // user check if email exist 
  Future<bool> checkIfEmailAlreadyExists(String email) async{
    var db = await getDb();
    var mData = await db.query(User_Table, where: '$Column_User_Email = ?', whereArgs: [email]);
    return mData.isNotEmpty;
  }

  // user Login
  Future<bool> authenticateUser(String email, String password) async{
    var db = await getDb();
    var mData = await db.query(User_Table, where: '$Column_User_Email = ? and $Column_User_Password = ?', whereArgs: [email, password]);
    if(mData.isNotEmpty){
      setUID(UserModel.fromMap(mData[0]).uId!);
    }
    return mData.isNotEmpty;
  }

  // get uuid
  Future<int> getUID() async{
    var pref = await SharedPreferences.getInstance();
    return pref.getInt(SplashPage.KEY)!;
  }

  // set uuid
  void setUID(int uid) async{
    var pref = await SharedPreferences.getInstance();
    pref.setInt(SplashPage.KEY, uid);
  }

  //Update user data 
  Future<bool> updateUserData({required UserModel updateUserData}) async{
    var db = await getDb();

    int count = await db.update(User_Table, updateUserData.toMap(), where: '$Column_User_Name = ? and $Column_User_Email =? and $Column_User_MobNo', whereArgs: ['${updateUserData.uName} , ${updateUserData.uEmail}, ${updateUserData.uMobNo}'] );
    return count > 0;
  }


  // EXPENSE 
  // 
  // 
  // 
  // add, update, delete Expenses

  Future<bool> addExpense({required ExpenseModel addExpense}) async {
    var db = await getDb();
    var uid = await getUID();
    addExpense.uid = uid;
    int rowsAffected = await db.insert(Expense_Table, addExpense.toMap());
    return rowsAffected > 0;
  }

  Future<bool> updateExpense({required ExpenseModel updateExpenseModel}) async{
    var db = await getDb();
    int rowsAffected = await db.update(Expense_Table, updateExpenseModel.toMap(), where: '$Column_Expense_Id = ?', whereArgs: [updateExpenseModel.eId]);
    return rowsAffected > 0;
  }

  Future<List<ExpenseModel>> fetchExpense() async{ 
    var db = await getDb();
    var uid = getUID();
    var expenseData = await db.query(Expense_Table, where: '$Column_Expense_UId = ?', whereArgs: ['uid']);

    List<ExpenseModel> listExpData = [];
    for(Map<String, dynamic>eachUser in expenseData){
      var each = ExpenseModel.fromMap(eachUser);
      listExpData.add(each);
    }
    return listExpData;
  }
}