import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final DocumentSnapshot item;

  const ProductDetailsPage({Key key, this.item}) : super(key: key);
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.item.data["name"]);
    return SafeArea(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              _topCustomNotificationsBar(),
              _productSlider(),
              _productDescriptionSection()
            ],
          ),
        ),
      ),
    );
  }

  _topCustomNotificationsBar() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _productSlider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Colors.white,
      child: Center(
        child: Image.network(widget.item.data["imgUrl"]),
      ),
    );
  }

  _productDescriptionSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      height: 800,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.item.data["name"].toUpperCase(),
                style: headingsBold,
              ),
              Text(
                "Ksh. ${widget.item.data["price"].toString().toUpperCase()}",
                style: headingsLight,
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            AVAILALE_SIZES,
            style: boldNormalText,
          ),
          SizedBox(height: 20),
          Text(
            AVAILALE_COLORS,
            style: boldNormalText,
          ),
          SizedBox(height: 30),
          Text(
            DESCRIPTION_TAG_STRING,
            style: boldNormalText,
          ),
          SizedBox(height: 20),
          Text(
            widget.item.data["description"],
            style: normalText,
          ),
          SizedBox(height: 20),
          SplashButton(
            width: MediaQuery.of(context).size.width * 0.5,
            elevated: true,
            color: Colors.blue,
            onPressed: () {},
            childWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  ADD_TO_CART_STRING.toUpperCase(),
                  style: boldNormalText.copyWith(color: Colors.white),
                ),
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
