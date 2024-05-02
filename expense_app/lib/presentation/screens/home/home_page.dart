
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/presentation/screens/expense_list_view.dart';
import 'package:expense_app/presentation/screens/home/statistic_page.dart';
import 'package:expense_app/presentation/screens/total_expense_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Widget> navPage = [
    ExpensesHomePage(),
    StatisticPage(),
    Center(child: Text('data'),),
    Center(child: Text('notification'),),
    Center(child: Text('profile'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mTitle: 'Home'),
      body: navPage[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_outlined),
            label: 'stat'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,),
            label: 'add'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notification'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: 'mail'
          ),
          //BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        onTap: (value) {
          selectedIndex = value;  
          setState(() {
            
          });
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){

      //   },
      //   child: Icon(Icons.add, color: Colors.pink,),
      // ),
    );
  }
  
}

Widget ExpensesHomePage(){
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monety', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Morning,'),
                          Text('Arati Kurde', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      SizedBox(width: 110,),
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
                child: TotalExpenseView(),
              ),
              Expanded(
                flex: 6,
                child: ExpenseListView()
              )
            ],
          ),
        ),
      );
  }