import 'dart:convert';

class Ratting {
  final String userId;
  final double Rating; // Kept original spelling

  Ratting({required this.userId, required this.Rating});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': Rating, // Ensured JSON key matches
    };
  }

  factory Ratting.fromMap(Map<String, dynamic> map) {
    return Ratting(
      userId: map['userId'],
      Rating: (map['rating'] ?? 0.0).toDouble(), // Fixed null handling
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Ratting.fromJson(String source) =>
      Ratting.fromMap(jsonDecode(source));
}
