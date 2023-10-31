import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-pages/CategoriesWidget.dart';
import 'package:flutter_application_1/home-pages/ItemWidget.dart';
import 'package:flutter_application_1/home-pages/add.dart';
import 'package:flutter_application_1/home-pages/noti.dart';
import 'package:flutter_application_1/home-pages/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../UserChatBox/chatHome.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("STYLE FEED",
      style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0c222f),
)
      ),
      actions: [
  IconButton(
    onPressed: () {
       Navigator.pushNamed(context, '/profile');
    },
    icon: Icon(Icons.person),
  ),
],

      ),
      
      body: ListView(children: [
        //HomeAppBar(),
        Container(
          //height: 500,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Color(0xFFEDECF2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )
        ),
        child: Column(children: [
          //search
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here...."
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 27,
              )
            ],),
          ),
          //Categories

        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
        child: Text(
          "Categories",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ),
        CategoriesWidget(),


        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          child: Text("Items",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
        ),
        //items
        ItemWidget()
        ],
        ),
        ),
      ],
      ),

      
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 247, 247, 247),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: GNav (
            iconSize: 25,
            onTabChange: (index){
              print(index);
            },
            color: Colors.black,
            activeColor: Colors.black,
            padding: EdgeInsets.all(20),
          tabs: [
            GButton(icon: Icons.home,
            onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Myhome(),
            ));
          },
            ),
            GButton(icon: Icons.add_box,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AddProductScreen(),
            ));
          },
          ),
            GButton(icon: Icons.notifications,
            onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => noti(),
            ));
          },  
            ),
            GButton(icon: Icons.message_rounded,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ChatHome(),
              ));
            },
            ),
          ],
        ),
        ),
      )
    );
  }
}


