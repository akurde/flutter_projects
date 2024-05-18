import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  
  final String name;
  final Color textColor;
  final Color btnColor;
  Widget? mWidget;
  final VoidCallback onTap;

  CustomButton({required this.name, required this.textColor, required this.btnColor, required this.onTap, this.mWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
        ),
        child: mWidget ?? Text(
          name,
          style: TextStyle(fontSize: 18, color: textColor),
        )
      ),
    );
  }
  
}