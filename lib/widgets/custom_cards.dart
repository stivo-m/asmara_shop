import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomClothesCards extends StatelessWidget {
  final String name, discount, price, imgUrl;

  const CustomClothesCards({
    Key key,
    this.name,
    this.discount,
    this.price,
    this.imgUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        child: Container(
          width: 200,
          height: 250,
          child: Stack(
            children: <Widget>[
              imgUrl == "" ? FlutterLogo(size: 250) : Image.network(imgUrl),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 9),
                  child: Card(
                    child: Container(
                      color: Colors.amber,
                      width: 50,
                      height: 20,
                      child: Center(
                        child: Text(
                          THIRTY_OFFER.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white70,
                        Colors.white54,
                        Colors.white24,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name.toUpperCase(),
                              style: boldNormalText,
                            ),
                            Text(PRICE_PREFIX + price, style: normalText),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        RatingBar(
                          itemSize: 20,
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
