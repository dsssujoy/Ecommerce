import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:suchi/model/user.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variable.dart';
import '../../../constants/utlis.dart';
import '../../../model/getAppProduct.dart';
import '../../../providers/user_provider.dart';

class ProductServices {
  void addToCart({
    required BuildContext context,
    required GetAllData product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'X-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorhandling(response: res, context: context, onSuccese: () {
        User user = userProvider.user.copyWith(
            cart: jsonDecode(res.body)['cart']
        );
        userProvider.setUserFromModel(user);
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void reteProduct({
    required BuildContext context,
    required GetAllData product,
    required double ratting,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rating'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'X-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
          'rating': ratting,
        }),
      );

      httpErrorhandling(response: res, context: context, onSuccese: () {
        showSnackBar(context, "Rating submitted successfully!");
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
