import 'package:flutter/material.dart';

class Product {
  final String image, title, description, name, disscount, left, info, size, quantity;
  final int price, id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color,
      required this.quantity,
      required this.name,
      required this.disscount,
      required this.left,
      required this.info,
      });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Hoodie",
      name : "Sisburma Icon Hoodie ",
      disscount: "-10%",
      left: "Only 3",
      info: "Sisburma Icon Hoodie",
      price: 28000,
      size: "Small",
      description: "Air-Layer Hoodie က ဝတ်တဲ့အခါမှာ ပေါ့ပါးနေပင်မယ့် Heavyweight ဖြစ်နေတဲ့ Feeling ကို ပေးစွမ်းနေမှာဖြစ်လို့ အမြန်ဆုံးဝယ်ထားလိုက်တော့ခင်ဗျာ။",
      image: "assets/hoodie.png",
      quantity: "100",
      color: Colors.transparent),
  Product(
      id: 2,
      title: " Rib Half-Zip Polo",
      disscount: "-20%",
      name : " Rib Half-Zip Polo",
      left: "Only 5",
      info: "Sisburma Rib \nHalf-Zip \nPolo has come.",
      price: 22000,
      size: "S",
      description: "Brand New Color Addition of Sisburma Rib Half-Zip Polo has come.",
      image: "assets/tshirt.png",
      quantity: "2",
      color: Colors.transparent),
  Product(
      id: 3,
      title: "X Knaing Tee",
      disscount: "-25%",
      left: "Only 20",
      name : "X Knaing Tee",
      info: "Urban Industry \nBasic T-Shirts ",
      price: 23000,
      size: "L",
      description: "Sisburma X Knaing Collection Tee",
      image: "assets/shirt.png",
      quantity: "3",
      color: Colors.transparent),
  Product(
      id: 4,
      title: "Jacket ",
      disscount: "-30%",
      left: "Only 7",
      name : "Sisburma Jacket ",
      info: "Sisburma Buttonless \nMelton Jacket ",
      price: 38000,
      size: "L",
      description: "Buttonless Melton Jacket",
      image: "assets/jacket.png",
      quantity: "4",
      color: Colors.transparent),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
