import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-pages/edit.dart';
import 'package:flutter_application_1/models/Product.dart';
import 'package:google_fonts/google_fonts.dart';


// class ReadMore extends StatefulWidget {
//   final Product _product;
//   ReadMore(this._product);

//   @override
//   _ReadMoreState createState() => _ReadMoreState();
// }
// class _ReadMoreState extends State<ReadMore> {
//   bool isExpanded = true;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         for(int i=0; i<products.length; i++)
//         Text(
//           products[i].description
//           ,
//           style: GoogleFonts.montserrat(
//               color: const Color.fromARGB(255, 94, 94, 94)),
//           maxLines: isExpanded ? 2 : 20,
//           overflow: TextOverflow.ellipsis,
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(
//               () {
//                 isExpanded = !isExpanded;
//               },
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               isExpanded ? 'Read More' : 'Read Less',
//               style: GoogleFonts.montserrat(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class DetailScreen extends StatelessWidget {
  bool isExpanded = true;
  final Product _product;
  DetailScreen(this._product);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        elevation: 0,
        title: Text(
          "Product",
          style: GoogleFonts.montserrat(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => edit(product: _product,),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      
      body: ListView(
        children: [
          SizedBox(height: 15),
          Column(
            children: [
              Image.asset(
                _product.image,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 425,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),


                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            _product.info,
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "\$" + _product.price.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            _product.left + " Left",
                            style: GoogleFonts.montserrat(color: Colors.red, 
                            fontWeight: FontWeight.bold,
                            )
                            ,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sizes",
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              _product.size,
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Product Description",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            _product.description,
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                                ),
                          ),
                        ),
                      ],

                        
    

                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
