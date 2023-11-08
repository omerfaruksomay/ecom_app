import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale

  final List<Product> _shop = [
    // Product 1
    Product(
      name: "product 1",
      price: 99.99,
      description: "description",
      //imagePath: imagePath,
    ),
    Product(
      name: "product 2",
      price: 99.99,
      description: "description",
      //imagePath: imagePath,
    ),
    Product(
      name: "product 3",
      price: 99.99,
      description: "description",
      //imagePath: imagePath,
    ),
    Product(
      name: "product 4",
      price: 99.99,
      description: "description",
      //imagePath: imagePath,
    ),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //get cart amount
  double getAmountOfCart() {
    double amount = 0;
    for (var i = 0; i < cart.length; i++) {
      amount += cart[i].price;
    }
    notifyListeners();
    return amount;
  }

  //add item to cart
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
