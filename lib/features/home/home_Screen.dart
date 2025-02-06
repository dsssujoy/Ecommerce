import 'package:flutter/material.dart';

import 'package:suchi/common/widgets/custom_bottom_bar.dart';
import 'package:suchi/features/home/widget/catagory_Home.dart';
import 'package:suchi/features/home/widget/crousel_2_image.dart';
import 'package:suchi/features/home/widget/crousel_image.dart';
import 'package:suchi/features/home/widget/fandom_Home.dart';
import 'package:suchi/features/home/widget/search_Home.dart';

import '../../constants/global_variable.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int coin=2;
  @override
  Widget build(BuildContext context) {
    // final user=Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgProduct.jpg"), // Ensure the correct path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: double.infinity,
                color: GlobalVariable.customGreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          child: Image.asset('images/proIcon.png'),
                        ),

                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.notifications, size: 30, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchHome()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.search, size: 30, color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      height: 25,
                                      child: Image.asset('images/coin.png')
                                  ),
                                  Text("$coin Coin",style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.025,fontWeight: FontWeight.bold,color: Colors.black),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              CatagoryHome(),
              CrouselImage(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Latest',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04)),
                        TextSpan(text: "  "),
                        TextSpan(text: 'Collection',style: TextStyle(color: Colors.black)),
                      ]
                    )),
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_circle_down_sharp,color: GlobalVariable.customGreen,)
                  ],
                ),
              ),
              Crousel2Image(),
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Shop',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04)),
                          TextSpan(text: "  "),
                          TextSpan(text: 'by Fandom!',style: TextStyle(color: Colors.black)),
                        ]
                    )),
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_circle_down_sharp,color: GlobalVariable.customGreen,)
                  ],
                ),
              ),
              FandomHome(),
            ],
          ),
        ),
      ),
    );
  }
}
