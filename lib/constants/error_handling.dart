import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:suchi/constants/utlis.dart';

void httpErrorhandling({
  required http.Response response,
  required  BuildContext context,
  required VoidCallback onSuccese
}){
  switch(response.statusCode){
    case 200:
      onSuccese();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context,response.body);
  }
}