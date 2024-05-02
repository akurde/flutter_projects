import 'package:flutter/material.dart';

class TotalExpenseView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Expanse Total', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
                SizedBox(height: 10,),
                Text('\$3734', style: TextStyle(
                  color: Colors.white,
                  fontSize: 35
                ),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      color: Colors.red,
                      child: Text('+\$240', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                    Text(' than last month', style: TextStyle(
                      color: Colors.white
                    ),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}