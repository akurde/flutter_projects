import 'package:expense_app/presentation/screens/on_board/login_page.dart';
import 'package:expense_app/presentation/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var pref = await SharedPreferences.getInstance();
            pref.setInt(SplashPage.KEY, 0);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
  
}