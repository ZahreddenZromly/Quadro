

import 'package:flutter/material.dart';
import 'package:quadro/store_system/models/product.dart';
class Shop extends ChangeNotifier {
//product for sale
  final List<Product> _shop = [
//product 1
    Product(
      name: "باطيني",
      price: 45.00,
      description: "باطينيات سيارات كوريات",
      imagePath: 'assets/car_part/breaks.jpg',
    ),
    //product 1
    Product(
      name: "بسطوني",
      price: 150.00,
      description: "بسطوني امريكي ",
        imagePath: 'assets/car_part/pistone.jpg',
    ),
    //product 1
    Product(
      name: "اطارات",
      price: 125.00,
      description: "اطارات يبانيةحجم 15",
        imagePath: 'assets/car_part/tire.jpg',
    ),
    //product 1
    Product(
      name: "بطارية",
      price: 350.00,
      description: "بطاريات غازية",
        imagePath: 'assets/car_part/battary.jpg',
    ),
    Product(
      name: "توربو",
      price: 900.00,
      description: "توربو للسيارات الاميكبة ",
      imagePath: 'assets/car_part/turbo.jpg',
    ),
    Product(
      name: "باراوانتي",
      price: 500.00,
      description: " باروانتي شيفرليت",
      imagePath: 'assets/car_part/barawante.jpg',
    ),
    Product(
      name: "شماعي",
      price: 30.00,
      description: " شماعي",
      imagePath: 'assets/car_part/shama.jpg',
    ),
    Product(
      name: "رضاتوري",
      price: 250.00,
      description: "رضاتوري ",
      imagePath: 'assets/car_part/radiator.jpg',
    ),
    Product(
      name: "قرسيوني",
      price: 450.00,
      description: "قرسيوني ",
      imagePath: 'assets/car_part/garsiune.jpg',
    ),
    Product(
      name: "كورتشيرا",
      price: 600.00,
      description: "كورتشيرا",
      imagePath: 'assets/car_part/cortchera.jpg',
    ),
  ];

//user cart
   List<Product> _cart = [];

//get product list
  List<Product> get shop => _shop;

//get user cart
  List<Product> get cart => _cart;

//add item to crt
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}