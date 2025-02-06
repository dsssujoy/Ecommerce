import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onPresed;
  final Icon icon;
  const AccountButton({super.key, required this.text, required this.onPresed, required this.icon});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: screenWidth*0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(
              width: 1,
              color: GlobalVariable.customGreen,
          ),

        ),
          onPressed: onPresed, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              icon,
              Text(text,style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.black,fontWeight: FontWeight.normal),),
            ],
          )),
    );
  }
}
