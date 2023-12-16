import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:practise/HomePage.dart';
import 'package:practise/LoginPage.dart';


import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home:SpalshPage('')
    );
  }
}

class SpalshPage extends StatefulWidget {
  var nameFromLogin;
  SpalshPage(this.nameFromLogin);

  @override
  State<SpalshPage> createState() => SpalshPageState();
}

class SpalshPageState extends State<SpalshPage> with SingleTickerProviderStateMixin{

 late Animation _animation;
 late AnimationController _animaioncontroller;
  
static const String KEYLOGIN = "login";

 bool _isVisible = false;

 @override
 void initState() {
   super.initState();
   // Set a timer to toggle the visibility of the text after 2 seconds
   Future.delayed(Duration(seconds:1), () {
     setState(() {
       _isVisible = true;
     });
   });
//This function is use for after spalsh screen where user should be go
   whereToGo();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height:double.infinity,
        width:double.infinity,
        color:Colors.black,
        child:Center(
          //It's use for fade effact
          child: AnimatedOpacity(
            duration: Duration(seconds: 2),
            curve:Curves.bounceInOut,
            opacity: _isVisible ? 1.0 : 0.0,
            child: Text(
              "BlackHat",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'BlackHat',
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }


  void whereToGo() async {
       var Sharedpref =  await SharedPreferences.getInstance();
       var isLoggedIn = Sharedpref.getBool(KEYLOGIN);


   Timer(Duration(seconds: 2),()
   {

     //If the condition will true then user is switch on the periculer page 
     if(isLoggedIn != null){
       //User switch on HomePage
       if(isLoggedIn){
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => HomePage(),));
       }
       //User switch on LoginPage
       else{
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => LoginPage(),));
       }
     }
     //User switch on LoginPage
     else{
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) =>LoginPage(),));
     }

   },
        
    
    );
   }
 }




