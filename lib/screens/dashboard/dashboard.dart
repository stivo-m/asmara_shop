import 'package:asmara_shop/screens/cart/cart.dart';
import 'package:asmara_shop/screens/dashboard/overview.dart';
import 'package:asmara_shop/widgets/appbar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var currentPage = 0;
  List pages = [
    Overview(),
    Overview(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CustomAppBar(),
          bottomNavigationBar: FancyBottomNavigation(
            inactiveIconColor: Colors.grey,
            tabs: [
              TabData(
                iconData: Icons.home,
                title: "Home",
              ),
              TabData(
                iconData: Icons.category,
                title: "Category",
              ),
              TabData(
                iconData: Icons.shopping_cart,
                title: "Cart",
              )
            ],
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          ),
          body: pages[currentPage]),
    );
  }
}
