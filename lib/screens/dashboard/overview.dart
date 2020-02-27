import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:asmara_shop/widgets/custom_cards.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    const double padding = 70;
    return Stack(
      children: <Widget>[
        SizedBox(height: 55),
        buildTopSlider(padding),
        buildOffersRow(padding),
      ],
    );
  }

  Align buildTopSlider(double padding) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: padding),
        child: CarouselSlider.builder(
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 9),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          height: 250.0,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 9,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                //decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset(images[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Align buildOffersRow(double padding) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: padding + 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    ON_OFFER.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(VIEW_ALL),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomClothesCards(
                    discount: items[index].discount.toString(),
                    imgUrl: items[index].imageUrls[0],
                    name: items[index].name,
                    price: items[index].price.toString(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
