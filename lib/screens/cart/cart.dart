import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:asmara_shop/widgets/appbar.dart';
import 'package:asmara_shop/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double total = 0;
  @override
  void initState() {
    _getTotal();
    super.initState();
  }

  double _getTotal() {
    double totals = 0;
    items.forEach(
      (item) => () {
        totals += item.price;
      },
    );

    return totals;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    YOUR_CART_STRING,
                    style: headingsBold,
                  ),
                  Text(
                    CART_ITEMS_STRING,
                    style: headingsLight.copyWith(fontSize: 17),
                  ),
                ],
              ),
            ),
            Container(
              height: 520,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  total += items[index].price;
                  return CartItem(
                    item: items[index],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    TOTAL_STRING + total.toString(),
                    style: headingsBold,
                  ),
                  SizedBox(width: 20),
                  RaisedButton.icon(
                    color: Colors.blue,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    label: Text(
                      PAY_NOW.toUpperCase(),
                      style: boldNormalText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
