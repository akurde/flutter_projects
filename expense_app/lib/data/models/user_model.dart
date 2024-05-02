import 'package:expense_app/data/repository/local/my_db_helper.dart';

class UserModel {

  int? uId;
  String uName;
  String uEmail;
  String uMobNo;
  String uPassword;

  UserModel({this.uId, required this.uName, required this.uEmail, required this.uMobNo, required this.uPassword});

  // from Map to Model
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      uId: map[MyDbHelper.Column_User_Id], 
      uName: map[MyDbHelper.Column_User_Name], 
      uEmail: map[MyDbHelper.Column_User_Email], 
      uMobNo: map[MyDbHelper.Column_User_MobNo], 
      uPassword: map[MyDbHelper.Column_User_Password]
    );
  }

  // from Model to Map
  Map<String, dynamic> toMap(){
    return {
      MyDbHelper.Column_User_Id : uId,
      MyDbHelper.Column_User_Name : uName,
      MyDbHelper.Column_User_Email : uEmail, 
      MyDbHelper.Column_User_MobNo : uMobNo, 
      MyDbHelper.Column_User_Password : uPassword
    };
  }
}