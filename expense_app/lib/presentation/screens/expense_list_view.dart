import 'package:flutter/material.dart';

class ExpenseListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Expense List', style:  TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber 
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tuesday, 14'),
                      Text('-\$1380'),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple[50],
                            ),
                            child: Icon(Icons.shopping_cart_outlined)
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Shop'),
                            Text('Buy new cloths'),
                          ],),
                        ],
                      ),
                      Text('-\$90'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple[50],
                            ),
                            child: Icon(Icons.mobile_screen_share_outlined)
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Electronic'),
                            Text('Buy new iPhone 14'),
                          ],),
                        ],
                      ),
                      Text('-\$1290'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber 
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monday, 13'),
                      Text('-\$60'),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple[50],
                            ),
                            child: Icon(Icons.emoji_transportation_outlined)
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Transportation'),
                            Text('Trip to Malang'),
                          ],),
                        ],
                      ),
                      Text('-\$60'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}