import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String name, description, size;
  final double price, discount;
  final Timestamp timestamp;
  final List<String> imageUrls;

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
