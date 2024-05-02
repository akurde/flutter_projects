
import 'package:expense_app/presentation/screens/total_expense_statistic_View.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget{

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Statistic', style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[50],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          )
                        ),
                        onPressed: (){
                                      
                        }, 
                        child: Text('This Month')
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TotalExpenseStatisticView(),
              ),
              
              Expanded(
                flex: 4,
                child: Container(padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expense Breakdown', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                          Text('Limit \$900 / week'),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[50],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          )
                        ),
                        onPressed: (){
                                      
                        }, 
                        child: Text('Week')
                      )
                    ],
                  ),) //ExpenseListView()
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text('Spending Details', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Your expenses are divided into 6 categories'),
                  ],
                ) //ExpenseListView()
              )
            ],
          ),
        ),
      ),      
    );
  }
}