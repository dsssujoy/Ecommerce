// To parse this JSON data, do
//
//     final getAllData = getAllDataFromJson(jsonString);

import 'dart:convert';
import 'package:suchi/model/ratting_model.dart';

List<GetAllData> getAllDataFromJson(String str) =>
    List<GetAllData>.from(json.decode(str).map((x) => GetAllData.fromJson(x)));

String getAllDataToJson(List<GetAllData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllData {
  String id;
  String name;
  String description;
  int price;
  int quantity;
  List<String> image;
  List<String> size;
  String catagory; // Kept original spelling
  int v;
  int? maxPrice;
  int? offer;
  List<Ratting>? rating; // Kept original spelling

  GetAllData({
    this.rating,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
    required this.catagory, // Kept original spelling
    required this.v,
    required this.maxPrice,
    required this.offer,
    required this.size,
  });

  factory GetAllData.fromJson(Map<String, dynamic> json) => GetAllData(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    quantity: json["quantity"],
    image: List<String>.from(json["image"].map((x) => x)),
    catagory: json["catagory"], // Kept original spelling
    v: json["__v"],
    maxPrice: json["maxPrice"],
    offer: json["offer"],
    size: List<String>.from(json["size"].map((x) => x)),
    rating: json["rating"] != null
        ? List<Ratting>.from(json["rating"].map((x) => Ratting.fromMap(x)))
        : [], // Fixed null handling
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "quantity": quantity,
    "image": List<dynamic>.from(image.map((x) => x)),
    "size": List<dynamic>.from(size.map((x) => x)),
    "catagory": catagory, // Kept original spelling
    "__v": v,
    "maxPrice": maxPrice,
    "offer": offer,
    "rating": rating != null
        ? List<dynamic>.from(rating!.map((x) => x.toMap()))
        : [], // Ensured correct JSON conversion
  };
}
