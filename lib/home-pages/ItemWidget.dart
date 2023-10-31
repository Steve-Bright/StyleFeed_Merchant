import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-pages/DetailScreen.dart';
import 'package:flutter_application_1/models/Product.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=0; i<products.length; i++)
        
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    products[i].disscount,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFEDECF2),
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                // Icon(Icons.favorite_border,
                // color: Colors.red,
                // ),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(products[i])));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(products[i].image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text(products[i].title, 
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                
                alignment: Alignment.centerLeft,
                child: Text(products[i].name, 
                style: TextStyle(
                  fontSize: 12, color: Colors.black,
                  fontWeight: FontWeight.bold
                )),
              ),

              Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(products[i].price.toString() +" \Kyats" ,
                  style: TextStyle(fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                  ),
                  Icon(Icons.delete,
                  color: Colors.black
                  )
                ],
              ),
              )
            ],
          ),
        )
      ],
    );
  }
}