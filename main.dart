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
 /* void initState() {

    super.initState();

    _animaioncontroller =AnimationController(vsync:this,duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.3,end: 1.0).animate(_animaioncontroller);

    _animaioncontroller.addListener(() { });
    _animaioncontroller.forward();//This line can be use in button also

    //This function is use for after spalsh screen where user should be go

  }*/

  var listRadious = [140.0,210.0,280.0,350.0,];
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
//This function is use for after spalsh screen where user should be go*/
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


          //reeple effect
        /*  Stack(
            alignment: Alignment.center,
            children: [
              // Animated circles
              ...listRadious.map((radius) => AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: radius * _animation.value,
                    height: radius * _animation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(1.0 - _animation.value),
                    ),
                  );
                },
              ),),

              //center logo
              AnimatedOpacity(

                opacity: myopacity,
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                child:   Text(
                  "BlackHat",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),*/


    );
  }


  void whereToGo() async {
       var Sharedpref =  await SharedPreferences.getInstance();
       var isLoggedIn = Sharedpref.getBool(KEYLOGIN);


   Timer(Duration(seconds: 2),()
   {
     if(isLoggedIn != null){
       if(isLoggedIn){
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => HomePage(),));
       }
       else{
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => LoginPage(),));
       }
     }
     else{
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) =>LoginPage(),));
     }

   },);

 }
 }




