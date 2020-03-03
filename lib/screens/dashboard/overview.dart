import 'package:asmara_shop/consts/routes_strings.dart';
import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/models/product_model.dart';
import 'package:asmara_shop/widgets/custom_cards.dart';
import 'package:asmara_shop/widgets/custom_chips.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  TextEditingController _searchController = TextEditingController();
  ScrollController _chipController = ScrollController();
  ScrollController _gridScrollController = ScrollController();
  double leftPadding = 5;

  @override
  Widget build(BuildContext context) {
    const double padding = 270;
    double chipPadding = 120;
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(height: 35),
            buildTitleBar(padding),
            buildSmallCards(chipPadding),
            // buildTopSlider(padding),
            buildOffersRow(padding),
          ],
        ),
      ],
    );
  }

  Widget buildTitleBar(double padding) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 35),
          Text("Our", style: headingsBold),
          SizedBox(height: 3),
          Text("Products", style: headingsLight),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _searchController,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(Icons.search),
                    hintText: SEARCH_TEXT,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: normalText,
                  //onChanged: (query) => updateSearchQuery,
                ),
              ),
              IconButton(
                icon: Icon(Icons.sort, size: 35),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
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
        padding: EdgeInsets.only(
          top: padding,
          left: leftPadding,
          right: leftPadding,
        ),
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
                    ON_OFFER,
                    style: headingsBold,
                  ),
                  Text(
                    VIEW_ALL,
                    style: normalText,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: StreamBuilder(
                stream: Firestore.instance.collection("products").snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      controller: _gridScrollController,
                      itemCount: map.values.toList().length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(
                              context,
                              PRODUCT_PAGE,
                              arguments: map,
                            );
                          },
                          child: CustomClothesCards(
                            discount: map.values.toList()[index]["discount"],
                            imgUrl: map.values.toList()[index][""],
                            name: map.values.toList()[index]["name"],
                            price: map.values.toList()[index]["price"],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Container());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSmallCards(double padding) {
    return Padding(
      padding: EdgeInsets.only(
        top: padding,
        left: leftPadding,
        right: leftPadding,
      ),
      child: Container(
        height: 200,
        child: ListView.builder(
          controller: _chipController,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CustomChip(
              index: index,
              categoryImage: categories[index].imageUrl,
              categoryName: categories[index].name,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController?.dispose();
    _searchController?.dispose();
    _gridScrollController?.dispose();
    super.dispose();
  }
}
