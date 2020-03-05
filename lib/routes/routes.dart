import 'package:asmara_shop/screens/auth/login.dart';
import 'package:asmara_shop/screens/auth/signup.dart';
import 'package:asmara_shop/screens/cart/cart.dart';
import 'package:asmara_shop/screens/dashboard/dashboard.dart';
import 'package:asmara_shop/screens/products/product_details.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => Dashboard());
    case 'cart':
      return MaterialPageRoute(builder: (context) => ShoppingCart());
    case 'login':
      return MaterialPageRoute(builder: (context) => Login());
    case 'register':
      return MaterialPageRoute(builder: (context) => Signup());
    case 'product_page':
      var item = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ProductDetailsPage(item: item));
    default:
      return MaterialPageRoute(builder: (context) => Dashboard());
  }
}
