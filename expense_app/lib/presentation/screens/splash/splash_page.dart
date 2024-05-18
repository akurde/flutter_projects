import 'package:expense_app/data/repository/local/my_db_helper.dart';
import 'package:expense_app/presentation/screens/home/home_page.dart';
import 'package:expense_app/presentation/screens/on_board/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  static const String KEY='UID';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoggedIn();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pp.png'),
            Text('Monety',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
        onPressed: (){
          checkLoggedIn();
         //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        },
        child: Icon(Icons.arrow_right_alt_sharp,size: 38,),
      ),
      body:Stack(
        children: [
          Align(alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(15),
              height: 550,
              width: 420,
              decoration: BoxDecoration(color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Easy way to monitor',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700),),
                Text('Your expense',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                Text('Safe your future by managing your',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey)),
                Text('expense right now ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey)),
              ],
              ),
            ),
          ),
          SizedBox(
            height: 500,
              width: 500,
              child: Image.asset('assets/images/main.png',fit: BoxFit.fill,)),
        ],
      ),
    );
  }
  
  void checkLoggedIn() async{
    var pref=await SharedPreferences.getInstance();
      var login=pref.getInt(SplashPage.KEY);
      if(login!=null){
        if(login>0){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }
  //   var db = MyDbHelper.db;
  //   var UID = await db.getUID();
  //   if(UID != null){
  //     if(UID>0){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  //     } else {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  //     }
  //   } else{
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  //   }
  }
}