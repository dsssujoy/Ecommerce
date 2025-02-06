import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/features/account/widget/account_button.dart';
import 'package:ionicons/ionicons.dart' as icon;

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AccountButton(text: 'Your Orders', onPresed: (){}, icon: Icon(icon.Ionicons.gift,size: 27,color: Colors.black12,),),
              AccountButton(text: 'Coupons', onPresed: (){}, icon: Icon(Icons.discount_outlined,size: 27,color: Colors.black12,),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AccountButton(text: 'Log Out', onPresed: (){}, icon: Icon(Icons.logout,size: 27,color: Colors.black12,),),
              AccountButton(text: 'Your Wish List', onPresed: (){}, icon: Icon(icon.Ionicons.heart,size: 27,color: Colors.red,),),
            ],
          )
        ],
      ),
    );
  }
}
