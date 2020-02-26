import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sender;
  final String recipient;
  final String orderID;
  final Timestamp timestamp;

  Message({
    this.sender,
    this.recipient,
    this.orderID,
    this.timestamp,
  });

  Message.fromMap(Map<String, dynamic> map)
      : this.sender = map["sender"],
        this.orderID = map["orderID"],
        this.recipient = map["recipient"],
        this.timestamp = map["timestamp"];

  Map toMap() {
    var map = Map<String, dynamic>();
    map["sender"] = this.sender;
    map["orderID"] = this.orderID;
    map["recipient"] = this.recipient;
    map["timestamp"] = this.timestamp;
    return map;
  }
}
