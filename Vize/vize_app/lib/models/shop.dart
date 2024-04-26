import 'package:flutter/material.dart';
import 'package:vizeapp/models/bike.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: "SPEARFISH C SLX",
      price: "4900",
      imagePath: "assets/images/trek1.png",
     
    ),
    Shoe(
      name: "SPEARFISH C XT",
      price: "6000",
      imagePath: "assets/images/trek2.png",
    ),
    Shoe(
      name: "SPEARFISH DEORE",
      price: "3000",
      imagePath: "assets/images/trek3.png",
    ),
    Shoe(
      name: "Fuel EX 8 XT Gen 6",
      price: "3750",
      imagePath: "assets/images/trek4.png",
    ),
  ];
  List<Shoe> userCart = [];
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
