import 'package:flutter/material.dart';

class TotalExpenseStatisticView extends StatelessWidget{
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Total Expense', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.more_horiz_outlined)
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text.rich(
                  TextSpan(
                    text: '\$3734', style: TextStyle(
                      color: Colors.white,
                      fontSize: 35
                    ),
                    children: [
                      TextSpan(text: ' / \$4000 per month', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),),
                    ]
                  )
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}