import 'dart:ui';
String uri='http://169.254.138.238:3000';
class GlobalVariable{
  static const Color customGreen=Color(0xFF37D4A5);
  static const Color customYello=Color(0xDBE8D94B);
  static const Color customWhite=Color(0xFFFFFFFF);

  static const List<String> crousalImage=[
    "images/c1.jpg",
    "images/c2.jpg",
    "images/c3.jpg",
    "images/c4.jpg"
  ];
  static const List<String> crousal2Image=[
    "images/a1.png",
    "images/a2.jpg",
    "images/a3.png",
    "images/a4.png"
  ];

  static const List<Map<String,String>> catagoryItem=[
    {
      'title':"Bengali",
      'image':"images/bengali.jpg"
    },
    {
      'title':"Men",
      'image':"images/male.jpg"
    },
    {
      'title':"Women",
      'image':"images/female.jpg"
    },
    {
      'title':"Hoodie",
      'image':"images/sun.jpg"
    },
    {
      'title':"Special",
      'image':"images/special.jpg"
    },
  ];

  static const List<Map<String,String>> fandomItem=[
    {
      'title':"images/marvel.png",
      'image':"images/f2.png"
    },
    {
      'title':"images/naru.png",
      'image':"images/f3.png"
    },
    {
      'title':"images/tom.png",
      'image':"images/f1.png"
    },
  ];
}