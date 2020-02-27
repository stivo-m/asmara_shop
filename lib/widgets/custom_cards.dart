import 'package:asmara_shop/consts/strings.dart';
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
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 8,
        child: Container(
          width: 200,
          height: 250,
          child: Stack(
            children: <Widget>[
              Image.asset(
                imgUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
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
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.blueAccent.withOpacity(0.8),
                        Colors.blue
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
                        Text(
                          name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingBar(
                              itemSize: 20,
                              initialRating: 3.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Text(
                              price,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
