import 'package:flutter/material.dart';
import 'package:practise/NewAcc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  @override
  //This is user for show or hide password button
  void initState() {
    super.initState();
    _showPassword = false; // Initialize it here
  }

  @override
  //Static username or password(for example only)
  var username = "kenil";
  var password = "101404"; // Convert password to a string

  //For user input
  final enterusername = TextEditingController();
  final enterpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: 25, fontFamily: 'BlackHat', color: Colors.black),
        ),
      ),
      body: 
      
      
      //Main container
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          //It's use for color shading on background
          gradient: LinearGradient(
            colors: [
              Color(0xff84fab0),
              Color(0xff8fd3f4),
            ],
            begin: FractionalOffset(
              1.0,
              0.0,
            ),
            end: FractionalOffset(0.0, 1.0),
          ),
        ),

        //Start UI for login page
        child: SingleChildScrollView(
          child: Center(

            //In this container we design an actual ui (for make ui more atractive)
            child: Container(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //we can also use padding widget for spacing between two widgets
                  SizedBox(
                    height: 140,
                  ),

                  //This all widgets is part of login page 
                  //logo
                  Text(
                    "BlackHat",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontFamily: 'BlackHat'),
                  ),

                  SizedBox(height: 120,),

                  // username
                  TextField(
                    controller: enterusername,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black54,
                          width: 1,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // password
                  TextField(
                    controller: enterpassword,
                    keyboardType: TextInputType.number,
                    obscureText:
                        !_showPassword, // Use _showPassword to control visibility
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black54,
                          width: 1,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black54,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  //login Button
                  ElevatedButton(
                    onPressed: () async {
                      if (username == enterusername.text &&
                          password == enterpassword.text) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool(SpalshPageState.KEYLOGIN, true);
                        print('Login Successful...!');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        print('Login Failed...!');
                      }
                    },
                    child: Container(
                      height: 25,
                      width: 45,
                      color: Colors.green,
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(fontSize: 17),
                      )),
                    ),
                  ),

                  SizedBox(height: 25,),

                  //Simple Text "OR"
                  Text('Or', style: TextStyle(fontSize: 35, color: Colors.black54),),

                  SizedBox(height: 25,),

                  //Google Login
                  Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.black54)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/google.png'),
                            height: 52,
                            width: 52,
                          ),
                          Text(
                            'Google Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //Facebook login
                  Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.black54)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/fackbook.png'),
                            height: 52,
                            width: 52,
                          ),
                          Text(
                            'Facebook Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 45,
                  ),

                  //Create new account
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewAccPage()));
                    },
                    child: Text(
                      'Create new account',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
