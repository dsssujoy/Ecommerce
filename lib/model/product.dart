import 'dart:convert';

class Product{
  final String name;
  final String description;
  final double price;
  final int quantity;
  final List<String> image;
  final List<String> size;
  final double Maxprice;
  final double Offer;
  final String catagory;
  String? id;

  Product({required this.size, required this.Maxprice, required this.Offer, required this.image, required this.catagory, required this.name, required this.description, required this.price, required this.quantity,this.id});

  Map<String,dynamic>toMap() {
    return {
      'name':name,
      'description':description,
      'price':price,
      'quantity':quantity,
      'image':image,
      'catagory':catagory,
      'id':id,
      'maxPrice':Maxprice,
      'offer':Offer,
      'size':size
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      catagory: map['category'],
      name: map['name'],
      description: map['description'],
      price: map['price'].toDouble(), // Ensures it's a double
      quantity: map['quantity'],
      id: map['_id'],
      image:List<String>.from(map['image']),
      Maxprice: map['maxPrice'].toDouble(),
      Offer: map['offer'].toDouble(),
      size: List<String>.from(map['size']),
    );
  }

  String toJson()=>jsonEncode(toMap());
  factory Product.fromJson(String source)=> Product.fromMap(jsonDecode(source));


}