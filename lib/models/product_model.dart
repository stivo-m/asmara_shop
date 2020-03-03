import 'package:asmara_shop/consts/strings.dart';

class Item {
  final String name, description, size;
  final double price, discount;
  final DateTime timestamp;
  final List<String> imageUrls;

  // category, description, name
  //size, price,
  //discount
  Item({
    this.name,
    this.description,
    this.size,
    this.price,
    this.discount = 0,
    this.timestamp,
    this.imageUrls,
  });

  Item.fromMap(Map<String, dynamic> item)
      : this.name = item["name"],
        this.description = item["description"],
        this.size = item["size"],
        this.price = item["price"],
        this.discount = item["discount"],
        this.timestamp = item["timestamp"],
        this.imageUrls = item["imageUrls"];

  Map toMap() {
    var item = Map<String, dynamic>();
    item["name"] = this.name;
    item["description"] = this.description;
    item["size"] = this.size;
    item["price"] = this.price;
    item["discount"] = this.discount;
    item["imageUrls"] = this.imageUrls;

    return item;
  }
}

class Categories {
  final String name;
  final String imageUrl;

  Categories(this.name, this.imageUrl);
}

List<Categories> categories = [
  Categories("Tshirts", AD_FIVE),
  Categories("Dresses", AD_ONE),
  Categories("Shoes", AD_TWO),
  Categories("Watches", AD_THREE),
];

List<Item> items = [
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_FIVE,
      AD_ONE,
      AD_TWO,
      AD_THREE,
    ],
    name: "White-Tshirt",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_FOUR,
      AD_FIVE,
      AD_SIX,
    ],
    name: "T-Shirts",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_SIX,
      AD_ONE,
      AD_TWO,
      AD_THREE,
    ],
    name: "Posters",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_FIVE,
      AD_ONE,
      AD_TWO,
      AD_THREE,
    ],
    name: "White-Tshirt",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_FOUR,
      AD_FIVE,
      AD_SIX,
    ],
    name: "T-Shirts",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
  Item(
    description: "",
    discount: 0,
    imageUrls: [
      AD_SIX,
      AD_ONE,
      AD_TWO,
      AD_THREE,
    ],
    name: "Posters",
    price: 550,
    size: "Large",
    timestamp: DateTime.now(),
  ),
];
