import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:suchi/model/getAppProduct.dart';
import 'package:suchi/providers/user_provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variable.dart';
import '../../../constants/utlis.dart';

class HomeServices {
  Future<List<GetAllData>> fetchCatagoryProduct({
    required BuildContext context,
    required String catagory,
  }) async {
    List<GetAllData> productList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // 🟢 Send GET request
      final res = await http.get(
        Uri.parse('$uri/api/products?catagory=$catagory'),
        headers: {
          'Content-Type': 'application/json',
          'X-auth-token': userProvider.user.token, // If auth is required
        },
      );

      // 🟢 Check for a successful response (HTTP 200)
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body); // ✅ Decode as Map<String, dynamic>

        if (jsonResponse['product'] != null) {
          List<dynamic> jsonData = jsonResponse['product']; // ✅ Extract the list

          // 🟢 Convert JSON response to List of GetAllData
          productList = jsonData.map((item) => GetAllData.fromJson(item)).toList();
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      showSnackBar(context, "Error: ${e.toString()}");
    }


    return productList;
  }
}