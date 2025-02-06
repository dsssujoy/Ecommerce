import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/features/home/catagory_deals.dart';

class CatagoryHome extends StatefulWidget {
  const CatagoryHome({super.key});

  @override
  State<CatagoryHome> createState() => _CatagoryHomeState();
}

class _CatagoryHomeState extends State<CatagoryHome> {

   void navigateCatagoryScreen(String catagory){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>CatagoryDeals(catagory: catagory)));
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // color: Colors.white,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariable.catagoryItem.length,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              navigateCatagoryScreen(GlobalVariable.catagoryItem[index]['title']!);
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.029),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(GlobalVariable.catagoryItem[index]['image']!,fit: BoxFit.cover,height: MediaQuery.of(context).size.width*0.19,width: MediaQuery.of(context).size.width*0.19,),
                  ),
                ),
                Text(GlobalVariable.catagoryItem[index]['title']!,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.025),)
              ],
            ),
          );
      }),
    );
  }
}
