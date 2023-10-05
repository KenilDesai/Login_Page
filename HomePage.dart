import 'package:flutter/material.dart';
import 'package:practise/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = [
    "Body Spray",
    "Sampoo",
    "Drinks",
    "kenil",
    "pavan"
  ];

  int current = 0;
  List<IconData> icons = [
    FontAwesomeIcons.sprayCan,
    FontAwesomeIcons.bottleWater,
    FontAwesomeIcons.wineBottle,
    FontAwesomeIcons.user,
    FontAwesomeIcons.phone

  ];

  @override
  Widget build(BuildContext context) {
    /* var arrdata = [
      {'name': 'Kenil', 'mobile': '7016253971', 'unseen': '1'},
      {'name': 'Arpit', 'mobile': '931686877', 'unseen': '4'},
      {'name': 'Rutil', 'mobile': '9512553594', 'unseen': '2'},
      {'name': 'Kirtan', 'mobile': '7984785722', 'unseen': '1'},
      {'name': 'Mayank', 'mobile': '6352191121', 'unseen': '5'},
      {
        'name': 'Pavan',
        'mobile': '7861903225',
        'unseen': '3',
      },
    ];
    var arrNames = ['Kenil', 'Kirtan', 'Rutil', 'Mayank', 'DK'];*/
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text(
          "BlackHat",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontFamily: 'BlackHat'),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
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
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Mall System',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),

            //Items
            SizedBox(
              width: double.infinity,
              height: 150,
              child: ListView.builder(
                  physics:BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 40,
                            width: 120,
                            margin: const EdgeInsets.fromLTRB(10, 50, 10, 5),
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.black26
                                  : Colors.transparent,
                              border: current == index
                                  ? Border.all(color: Colors.white10, width: 1)
                                  : Border.all(color: Colors.black54, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: current == index
                                        ? Colors.black87
                                        : Colors.black54),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          child: Container(
                            height: 5,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          visible: current == index,
                        ),
                      ],
                    );
                  }),
            ),

            Visibility(
              child: Expanded(
                flex: 1,
                child: Container(
                  width: 410,
                  decoration:BoxDecoration(
                    border: Border.all(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Icon(icons[current],size: 150,color: Colors.black45),
                ),
              ),
            ),


            SizedBox(height: 20,),

            //Log Out Btn
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(SpalshPageState.KEYLOGIN, false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('LogOut')),
          ],
        ),
        /* Column(
          children: [
            SizedBox(
              height: 100,
            ),




          ],
        ),*/
      ),
    );
  }
}
