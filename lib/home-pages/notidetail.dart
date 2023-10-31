import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notidetail extends StatefulWidget {
  const notidetail({super.key});

  @override
  State<notidetail> createState() => _notidetailState();
}

class _notidetailState extends State<notidetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          elevation: 0,
          title: Text(
            "Notification",
            style: GoogleFonts.montserrat(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),

body: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16.0), // Replace with your padding value
          padding: EdgeInsets.all(16.0), // Replace with your padding value
          decoration: BoxDecoration(
            color: Colors.white, // Replace with kWhiteColor
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)], // Replace with kLightColor
          ),
          child: Column(
            children: [
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: TextStyle(
                  // Replace with kDarkTextStyle
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Image(image: AssetImage("assets/noti.png")),
              SizedBox(height: 16.0),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(color: Colors.grey), // Replace with kLightColor
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '18/Oct/2021 04:42 PM',
                  style: TextStyle(color: Colors.grey), // Replace with kLightColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
