import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:asmara_shop/widgets/custom_add_subtract_widget.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  total += items[index].price;
                  return Padding(
                    padding: EdgeInsets.only(right: 9),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 9,
                      ),
                      leading: CircleAvatar(
                        radius: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            items[index].imageUrls[0],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(
                        items[index].name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(APP_NAME),
                          AddSubtractWidget(),
                        ],
                      ),
                      trailing: Text(
                        items[index].price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        "PAY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 9),
                    Text(
                      "Totals: " + total.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
