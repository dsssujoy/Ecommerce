import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suchi/constants/error_handling.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/constants/utlis.dart';
import 'package:suchi/features/home/home_Screen.dart';
import 'package:suchi/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:suchi/providers/user_provider.dart';
class AuthService{
  //sign up function
  void singnUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password
})async{
    try{
      User user=User(id: '', name: name, password: password, address: '', type: '', token: '', email: email, cart: []);
      http.Response res=await http.post(Uri.parse('${uri}/api/signup'),body: user.toJson(),headers: <String,String>{
        'Content-Type':'application/json; charset=UTF-8',
      });
      print(res.body);
      httpErrorhandling(response: res, context: context, onSuccese: (){
        showSnackBar(context, 'Account has been Created, you can Log in');
      });
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  //sign in function
  void singnInUser({
    required BuildContext context,
    required String email,
    required String password
  })async{
    try{
      http.Response res=await http.post(Uri.parse('${uri}/api/signin'),body: jsonEncode({
        'email':email,
        'password':password
      }),headers: <String,String>{
        'Content-Type':'application/json; charset=UTF-8',
      });
      print(res.body);
      httpErrorhandling(response: res, context: context, onSuccese: ()async{
        showSnackBar(context, 'Log in Successfully');
        SharedPreferences pref=await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context,listen: false).setUser(res.body);
        await pref.setString('X-auth-token', jsonDecode(res.body)['token']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false, // Condition to determine which routes to keep
        );



      });
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }



  //get te user

  void getUserData(
    BuildContext context,
  )async{
    try{
      SharedPreferences pref=await SharedPreferences.getInstance();
      String? token=pref.getString('X-auth-token');

      if(token==null){
        pref.setString('X-auth-token', '');
      }

      var tokenRes=await http.post(Uri.parse('$uri/api/tokenIsValid'),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
          'X-auth-token': token!
        }
      );

      var response=jsonDecode(tokenRes.body);
      if(response==true){
        http.Response httpRes=await http.get(Uri.parse('$uri/userData'),
        headers:<String,String> {
          'Content-Type':'application/json; charset=UTF-8',
          'X-auth-token': token
        });

        var userProvider=Provider.of<UserProvider>(context,listen: false);
        userProvider.setUser(httpRes.body);
      }



    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}