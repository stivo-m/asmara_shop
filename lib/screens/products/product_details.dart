import 'package:asmara_shop/consts/routes_strings.dart';
import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Item item;

  const ProductDetailsPage({Key key, this.item}) : super(key: key);
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).popAndPushNamed(HOME);
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
        child: Image.asset(widget.item.imageUrls[0]),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.item.name.toUpperCase(),
                style: headingsBold,
              ),
              Text(
                "Ksh. ${widget.item.price.toString().toUpperCase()}",
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
          )
        ],
      ),
    );
  }
}
