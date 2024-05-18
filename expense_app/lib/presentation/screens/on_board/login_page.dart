import 'package:expense_app/data/repository/local/my_db_helper.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/presentation/screens/home/home_page.dart';
import 'package:expense_app/presentation/screens/on_board/sign_up_page.dart';
import 'package:expense_app/presentation/screens/splash/splash_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myTextField(controllerName: emailController, labelText: 'Email' , hint: 'Enter your Email'),
            mySizedBox(),
            myTextField(controllerName: passController, labelText: 'Password' , hint: 'Enter your Password'),
            mySizedBox(),
            ElevatedButton(
              onPressed: () async{
                if(emailController.text.toString() != "" && passController.text.toString() != ""){
                  var db = MyDbHelper.db;

                  var check = await db.authenticateUser(emailController.text.toString(), passController.text.toString());
                  if(check){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    // var pref = await SharedPreferences.getInstance();
                    // pref.setBool(SplashPage.KEY, true);
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invaid Credentials')));
                  }
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invaid Credentials')));
                }
              }, 
              child: Text('Login', style: TextStyle(fontSize: 20),),
            ),
            mySizedBox(),
            Text.rich(
              TextSpan(
                text : "New User?", 
                //style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Create Account Now',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()))
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}