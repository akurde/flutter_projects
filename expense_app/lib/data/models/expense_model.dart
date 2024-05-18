import 'package:expense_app/data/repository/local/my_db_helper.dart';

class ExpenseModel{
  int eId;
  String eTitle;
  String eDesc;
  String eTime;
  String eAmount;
  String eBalance;
  String eType;
  int eCatId;
  int uid;

  ExpenseModel({
    required this.eId, 
    required this.eTitle,
    required this.eDesc,
    required this.eTime,
    required this.eAmount,
    required this.eBalance,
    required this.eType,
    required this.eCatId,
    required this.uid
  });

  //From map to model
  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
      eId: map[MyDbHelper.Column_Expense_Id], 
      eTitle: map[MyDbHelper.Column_Expense_Title], 
      eDesc: map[MyDbHelper.Column_Expense_Desc], 
      eTime: map[MyDbHelper.Column_Expense_Time], 
      eAmount: map[MyDbHelper.Column_Expense_Amount], 
      eBalance: map[MyDbHelper.Column_Expense_Balance], 
      eType: map[MyDbHelper.Column_Expense_Type], 
      eCatId: map[MyDbHelper.Column_Expense_CategoryId], 
      uid: map[MyDbHelper.Column_Expense_UId]
    );
  }

  //from model to map
  Map<String, dynamic>toMap(){
    return {
      MyDbHelper.Column_Expense_Id : eId,
      MyDbHelper.Column_Expense_Title : eTitle,
      MyDbHelper.Column_Expense_Desc : eDesc,
      MyDbHelper.Column_Expense_Time : eTime,
      MyDbHelper.Column_Expense_Amount : eAmount,
      MyDbHelper.Column_Expense_Balance : eBalance,
      MyDbHelper.Column_Expense_Type : eType,
      MyDbHelper.Column_Expense_CategoryId : eCatId,
      MyDbHelper.Column_Expense_UId : uid
    };
  }
  

}