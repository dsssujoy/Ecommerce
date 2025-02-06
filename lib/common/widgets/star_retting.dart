import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRetting extends StatelessWidget {
  const StarRetting({super.key, required this.ratting});
  final double ratting;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: ratting,
      itemSize: 15,
      itemBuilder: (context,_)=> Icon(Icons.favorite_border,color: Colors.orange,),
    );
  }
}
