import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:suchi/constants/error_handling.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/constants/utlis.dart';
import 'package:suchi/model/getAppProduct.dart';
import 'package:suchi/model/product.dart';
import 'package:suchi/providers/user_provider.dart';

class AdminServices{
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String catagory,
    required double Maxprice,
    required double Offer,
    required List<File> image,
    required List<String> sizes,

})async{
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    try{
      final cloudnary=CloudinaryPublic('deetjlmjm', 'sujoyDas');
      List<String> imgURL=[];
      for(int i=0;i<image.length;i++){
       CloudinaryResponse res= await cloudnary.uploadFile(CloudinaryFile.fromFile(image[i].path,folder: name));
       imgURL.add(res.secureUrl);
      }
      Product product=Product(image: imgURL, catagory: catagory, name: name, description: description, price: price, quantity: quantity, Maxprice: Maxprice, Offer: Offer, size: sizes);
      http.Response res=await http.post(Uri.parse('$uri/admin/add-product'),headers: {
        'Content-Type':'application/json; charset=UTF-8',
        'X-auth-token':userProvider.user.token
      },body: product.toJson());
      httpErrorhandling(response: res, context: context, onSuccese: (){
        showSnackBar(context, 'Product Add Successfully');
        Navigator.pop(context);
      });

    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  List<GetAllData> productList=[];
  //get all product
  Future<List<GetAllData>> fetchAllProduct(BuildContext context)async{
    try{
      final res=await http.get(Uri.parse('$uri/admin/get-all-product'));
      var data=jsonDecode(res.body.toString());
      if(res.statusCode==200){
        for(Map<String,dynamic> index in data){
          productList.add(GetAllData.fromJson(index));
        }
        return productList;
      }

    }catch(e){
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  //delte product
  void deleteProduct({required BuildContext context, required GetAllData product, required  VoidCallback onSucessed})async{
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    try{
      http.Response res=await http.post(Uri.parse('$uri/admin/delete-product'),headers: {
        'Content-Type':'application/json; charset=UTF-8',
        'X-auth-token':userProvider.user.token
      },body: jsonEncode({
        'id':product.id
      }));
      httpErrorhandling(response: res, context: context, onSuccese: (){
        showSnackBar(context, 'Product Delete Successfully');
      });

    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}