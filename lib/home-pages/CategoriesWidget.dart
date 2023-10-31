import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    List catlist = [
      "All","Man","Woman","Child","Shirts","Pants","Jackets"
    ];
   return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(padding: EdgeInsets.only(top: 1),
      child: Row(children: [
        for(int i = 0; i < 7; i++ )
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 18),
            decoration: BoxDecoration(
              color: catlist[i] == "ALL"
              ? Colors.cyan
              : Colors.white,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Text(
              catlist[i],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
      ]),
      ),
    );
  }
}