import 'package:flutter/material.dart';
import 'package:suchi/features/account/widget/account_setting_button.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white,
      child: Column(
        children: [
          AccountSettingButton(text: 'My Profile', text2: 'Edit Personal Information', onPressed: () {  },),
          SizedBox(height: 20,),
          AccountSettingButton(text: 'Refer and Earn', text2: 'Invite your Friends and earn rewards', onPressed: () {  },),
          SizedBox(height: 20,),
          AccountSettingButton(text: 'Customer Support', text2: 'Feel free to connect!', onPressed: () {  },),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
