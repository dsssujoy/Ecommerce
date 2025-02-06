import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';

class FandomHome extends StatefulWidget {
  const FandomHome({super.key});

  @override
  State<FandomHome> createState() => _FandomHomeState();
}

class _FandomHomeState extends State<FandomHome> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // color: Colors.white,
      height: 470,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariable.fandomItem.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.029),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(GlobalVariable.fandomItem[index]['image']!,fit: BoxFit.cover,height: MediaQuery.of(context).size.width*0.69,width: MediaQuery.of(context).size.width*0.69,),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.3,
                  child: Image.asset(GlobalVariable.fandomItem[index]['title']!,fit: BoxFit.cover,),
                )
              ],
            );
          }),
    );
  }
}
