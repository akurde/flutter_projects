import 'package:expense_app/data/models/user_model.dart';
import 'package:expense_app/data/repository/local/my_db_helper.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/presentation/screens/on_board/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var passController1 = TextEditingController();
  var nameController = TextEditingController();
  var mobNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myTextField(controllerName: emailController, labelText: 'Email' , hint: 'Enter your Email'),
            mySizedBox(),
            myTextField(controllerName: nameController, labelText: 'Name', hint: 'Enter your Name'),
            mySizedBox(),
            myTextField(controllerName: mobNoController, labelText: 'Mobile No' , hint: 'Enter your Mob No'),
            mySizedBox(),
            myTextField(controllerName: passController, labelText: 'Password', hint: 'Enter your Password'),
            mySizedBox(),
            myTextField(controllerName: passController1, labelText: 'Confirm Password', hint: 'Enter your Password again'),
            mySizedBox(),
            ElevatedButton(
              onPressed: () async{
                if(emailController.text.toString() != "" && nameController.text.toString() != "" && mobNoController.text.toString() != ""
                    && (passController.text.toString() == passController1.text.toString()) && passController.text.toString() != "" && passController1.text.toString() != "" 
                ){
                  var db = MyDbHelper.db; 
                  var check = await db.addNewUser(newUser: UserModel(
                    uName: nameController.text, 
                    uEmail: emailController.text, 
                    uMobNo: mobNoController.text, 
                    uPassword: passController.text,
                  ));
                  if(check){
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email Already Exist'),
                        action: SnackBarAction(
                          label: 'Login Page', 
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        ),
                      ));
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invaid Credentials')));
                }
              }, 
              child: Text('Sign Up', style: TextStyle(fontSize: 20),),
            ),
            InkWell(
              onTap : () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Login Now')
            ),
          ],
        ),
      ),
    );
  }
  
}