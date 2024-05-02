import 'package:flutter/material.dart';

TextStyle mTextStyleBold34({Color mColor = Colors.black}){
  return TextStyle(
    fontSize: 34,
    fontFamily: 'fontMain',
    color: mColor,
    fontWeight: FontWeight.bold
  );
}

TextStyle mTextStyle34({
    Color mColor = Colors.black,
    FontWeight mWeight = FontWeight.normal
  }){
  return TextStyle(
    fontSize: 34,
    fontFamily: 'fontMain',
    color: mColor,
    fontWeight: mWeight
  );
}

PreferredSizeWidget MyAppBar({required String mTitle}) => AppBar(
  title: Text(mTitle),
);