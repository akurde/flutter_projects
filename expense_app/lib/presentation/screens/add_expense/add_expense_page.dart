import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/repository/local/my_db_helper.dart';
import 'package:expense_app/domain/app_constant.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/presentation/app_widgets/custom_button.dart';
import 'package:expense_app/presentation/app_widgets/expense_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget{
  num balance;
  AddExpenseScreen({required this.balance});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseState();

}

class _AddExpenseState extends State<AddExpenseScreen>{

  String selectedTransactionType = "Debit";
  var selectedCatIndex = -1;
  DateTime expenseDate = DateTime.now();
  
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000, 2, 15), 
      lastDate: DateTime.now()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.lightBlue.shade200,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            // myTextField(controllerName: titleController, labelText: 'Name your expense', hint: 'Name'),
            // mySizedBox(),
            // myTextField(controllerName: descController, labelText: 'Add description', hint: 'Description'),
            // mySizedBox(),
            // myTextField(controllerName: amountController, labelText: 'Enter amount', hint: 'Amount'),
            // mySizedBox(),
            ExpenseTextField(labelText: 'Name your expense', controller: titleController, iconData: Icons.abc),
            ExpenseTextField(labelText: 'Add description', controller: descController, iconData: Icons.abc),
            ExpenseTextField(labelText: 'Enter amount', controller: amountController, iconData: Icons.money_sharp),
            DropdownButton(
              dropdownColor: Colors.blue,
              focusColor: Colors.white,
              value: selectedTransactionType,
              items: ["Debit", "Credit"].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(
                    type,
                    style: TextStyle(color: Colors.white),
                  )
                );
              }).toList(), 
              onChanged: (newValue){
                setState(() {
                  selectedTransactionType = newValue!;
                });
              }
            ),


            CustomButton(
              name: 'Choose Expense', textColor: Colors.black, btnColor: Colors.white,
              mWidget: selectedCatIndex != -1 ? Row(
                children: [
                  Image.asset(
                    AppConstant.mCategories[selectedCatIndex].catImgPath,
                    width: 30,
                    height: 30,
                  ),
                  Text(" - ${AppConstant.mCategories[selectedCatIndex].catTitle}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
             ) : null,
             onTap: (){
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10)
                  )
                ),
                context: context, 
                builder: (context){
                  return GridView.builder(
                    itemCount: AppConstant.mCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ), 
                    itemBuilder: (context, index){
                      var eachCat = AppConstant.mCategories[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedCatIndex = index;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(eachCat.catImgPath),
                          ),
                        ),
                      );
                    }
                  );
                }
              );
             },
            ),

            CustomButton( 
              name: DateFormat.yMMMMd().format(expenseDate), textColor: Colors.deepPurple, btnColor: Colors.white, 
              onTap: (){
                _selectDate(context);
              }
            ),
            CustomButton(
              name: 'Add Expense', 
              textColor: Colors.white, 
              btnColor: Colors.black, 
              onTap: (){
                var newExpense = ExpenseModel(
                  eId: 0, 
                  eTitle: titleController.text, 
                  eDesc: descController.text, 
                  eTime: expenseDate.millisecondsSinceEpoch.toString(), 
                  eAmount: amountController.text, 
                  eBalance: widget.balance.toString(), 
                  eType: selectedTransactionType, 
                  eCatId: AppConstant.mCategories[selectedCatIndex].catId, 
                  uid: 0
                );

                var db = MyDbHelper.db;
                db.addExpense(addExpense: newExpense);

                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
  
}