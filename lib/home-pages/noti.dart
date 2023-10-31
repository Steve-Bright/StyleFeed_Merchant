import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-pages/add.dart';
import 'package:flutter_application_1/home-pages/home.dart';
import 'package:flutter_application_1/home-pages/notidetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class noti extends StatefulWidget {
  const noti({super.key});

  @override
  State<noti> createState() => _notiState();
}

class _notiState extends State<noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          elevation: 0,
          title: Text(
            "Notifications",
            style: GoogleFonts.montserrat(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),




   body: ListView.separated(
    physics: ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context,index) {
    return ListTile(
      leading: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/noti.png"),fit: BoxFit.cover,))),
      title: Text('E-commerce', style: TextStyle(color: kDefaultIconDarkColor),),
    subtitle: Text('A new Order', style: TextStyle(color: kDefaultIconDarkColor),),
     onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => notidetail())),
    enabled: true,
    );
   }, separatorBuilder: (context, index) {
    return Divider();
   },
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
          //   onPressed: () {
          //   Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => SMS(),
          //   ));
          // },  
            ),
          ],
        ),
        ),
      )
    );
  }
}