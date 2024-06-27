import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_api/screens/home_page.dart';
import 'package:news_api/screens/initial_page.dart';
import 'package:news_api/utils/util_helper.dart';

class SplashPage extends StatefulWidget{

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitialPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryWhite,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            color: Colors.black.withOpacity(0.5)
          ),
          child: SizedBox(
            width: 100,
            height: 100,
            // child: Image.asset('name', fit: BoxFit.contain,),
          ),
        ),
      ),
    );
  }
}