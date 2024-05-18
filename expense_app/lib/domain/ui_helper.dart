import 'package:flutter/material.dart';

myTextField({required TextEditingController controllerName, required String labelText, required String hint}) {
  return TextField(
    controller: controllerName,
    decoration : InputDecoration(
      hintText: hint,
      label: Text(labelText),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

mySizedBox(){
  return SizedBox(
    height: 10,
  );
}

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