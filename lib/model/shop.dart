import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/food_model.dart';

class Shop extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
        name: "Sushi", price: '10', ratings: '4.9', imgPath: 'assets/pic1.png'),
    Food(
        name: "Salmon Sushi",
        price: '30',
        ratings: '4.9',
        imgPath: 'assets/pic2.png'),
    Food(
        name: "Toona fish",
        price: '20',
        ratings: '4.9',
        imgPath: 'assets/pic3.png'),
  ];

  final List<Food> _cart = [];

  List<Food> get menu => [..._menu];
  List<Food> get cart => [..._cart];

  void addItem(int quantity, Food foodItem) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeItem(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
