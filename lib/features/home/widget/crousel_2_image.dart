import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';

class Crousel2Image extends StatelessWidget {
  const Crousel2Image({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariable.crousal2Image.map((i){
        return Builder(builder: (BuildContext context)=>
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(i,fit: BoxFit.cover,)));
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height*0.50,
        viewportFraction: 0.92,
        autoPlay: true,
      ),
    );
  }
}
