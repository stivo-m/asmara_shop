import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Item item;

  const CartItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0.5,
        ),
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.only(
            top: 5,
            right: 19,
            bottom: 8,
          ),
          leading: CircleAvatar(
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.asset(
                item.imageUrls[0],
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            item.name.toUpperCase(),
            style: boldNormalText,
          ),
          subtitle: Text(
            "Ksh. ${item.price.toString()}",
            style: normalText,
          ),
          trailing: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Center(
              child: Text(
                "x2",
                style: boldNormalText.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
