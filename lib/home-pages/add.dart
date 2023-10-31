import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:custom_text_field/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-pages/home.dart';
import 'package:flutter_application_1/home-pages/noti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:multiselect/multiselect.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descritpionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String category = 'Shoe';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descritpionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }
  List<String> productCategories = [
    "Shoe","Dress","Shirt","Jacket"
  ];

  List<String> size = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  List<String> selectedsize = [];

  
  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      // Do something with the selected image.
      // For example, you can save it to a variable or display it.
      // _image = File(pickedImage.path);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          elevation: 0,
          title: Text(
            "Adding Products",
            style: GoogleFonts.montserrat(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20,),

                GestureDetector(
  onTap: () {
    _pickImage(ImageSource.gallery); // You can also use ImageSource.camera if you want to open the camera.
  },
  child: DottedBorder(
    borderType: BorderType.RRect,
    radius: const Radius.circular(10),
    dashPattern: [10, 4],
    strokeCap: StrokeCap.round,
    child: Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.folder_open, size: 40),
          const SizedBox(height: 15),
          Text(
            'Select Product Images',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    ),
  ),
),

                const SizedBox(height: 30,),

                CustomTextField(
                  controller: productNameController,
                  hint: 'Product name',
                ),
                const SizedBox(height: 10,),

                CustomTextField(
                  controller: descritpionController,
                  hint: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10,),

                CustomTextField(
                  controller: priceController,
                  hint: 'Price',
                ),
                const SizedBox(height: 10,),

                CustomTextField(
                  controller: quantityController,
                  hint: 'Quantity',
                ),
                const SizedBox(height: 15,),

                DropDownMultiSelect(
                whenEmpty: 'Size',
                options: size,
                selectedValues: selectedsize,
                onChanged: (value) {
                setState(() {
                 selectedsize = value;
                     });
                 print('You have selected $selectedsize sizes.');
                   },
  // decoration: BoxDecoration(
  //   border: Border.all(color: Colors.black),
  // ),
                  ),
                  const SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item)
                        );
                    }).toList(),
                    onChanged: (String? newVal){
                      setState(() {
                        category = newVal!;
                      });
                    }
                  ),
                ),
                
                
                const SizedBox(height: 20,),
                Container(
                width: 300, 
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 primary: Colors.grey, 
                 onPrimary: Colors.white, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                 ),
             elevation: 4, 
             ),
    onPressed: () {
      // Add your action here
    },
    child: Text('ADD', style: TextStyle(fontSize: 16)),
  ),
)

              ],
            ),
          ),
        ),
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
            GButton(icon: Icons.sms,
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