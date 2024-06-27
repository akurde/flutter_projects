import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_firebase/otp_page.dart';

class LoginPage extends StatefulWidget{

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phnController = TextEditingController();
  bool isLoading = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Phone Authentication', style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 40,),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phnController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.25),
                  filled: true,
                  hintText: "Enter Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 20,),
              isLoading ? CircularProgressIndicator() : 
              ElevatedButton(onPressed: () async{
                setState(() {
                  isLoading = true;
                });
                //TODO: LOGIN WITH PHONE
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phnController.text,
                  verificationCompleted: (PhoneAuthCredential){}, 
                  verificationFailed: (error){
                    print(error.toString());
                  }, 
                  codeSent: (verificationId, forceResendingToken){
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                        context, 
                        MaterialPageRoute(
                              builder: (context) => OtpPage(verificationId: verificationId,)
                        )
                    );
                  }, 
                  codeAutoRetrievalTimeout: (verificationId){
                    print("Auto Retrival timeout");
                  }
                );
                  
              }, child: Text('Sign In', style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold
              ),),),
            ],
          ),
        ),
    );
  }
}