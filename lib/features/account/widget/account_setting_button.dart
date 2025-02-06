import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';


class AccountSettingButton extends StatelessWidget {
  final String text;
  final String text2;
  final VoidCallback onPressed;
  const AccountSettingButton({super.key, required this.text, required this.text2, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$text",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,color: Colors.black),),
            Text("$text2",style: TextStyle(color: Colors.blueGrey),),
            Divider()
          ],
        ),
      ),
    );
  }
}
