import 'package:expense_app/data/repository/local/my_db_helper.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  int catId;
  String catImgPath;
  String catTitle;

  // String _cName;
  // set catName(String name){
  //   _cName = name;
  // }

  // String get catName { return _cName;}

  CategoryModel({required this.catId, required this.catImgPath, required this.catTitle});

  // from map to Model
  factory CategoryModel.fromMap(Map<String, dynamic> map){
    return CategoryModel(
      catId: map[MyDbHelper.Column_Category_Id], 
      catImgPath: map[MyDbHelper.Column_Category_Image], 
      catTitle: map[MyDbHelper.Column_Category_Name],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      MyDbHelper.Column_Category_Id : catId,
      MyDbHelper.Column_Category_Image : catImgPath,
      MyDbHelper.Column_Category_Name : catTitle,
    };
  }
}