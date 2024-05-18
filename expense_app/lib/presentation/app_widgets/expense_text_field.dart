import 'package:flutter/material.dart';

class ExpenseTextField extends StatelessWidget{

  final String labelText;
  final IconData iconData;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  ExpenseTextField({
    required this.labelText,
    required this.iconData,
    this.keyboardType = TextInputType.text,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)
          ),
          label: Text(
            labelText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
          suffixIcon: Icon(
            iconData,
            size: 30,
          ),
        ),
      ),
    );
  }
}