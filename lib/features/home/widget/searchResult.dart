import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suchi/common/widgets/star_retting.dart';
import 'package:suchi/features/home/product_details.dart';
import 'package:suchi/features/home/services/search_services.dart';
import 'package:suchi/model/getAppProduct.dart';

import '../../../providers/user_provider.dart';

class Searchresult extends StatefulWidget {
  const Searchresult({super.key, required this.serachQuery});
  final String serachQuery;

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  List<GetAllData>? productList=[];
  final SearchServices searchServices=SearchServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchResult();
  }
  double avgRating=0;
  double myRating=0;
  void fetchSearchResult()async{
    productList=await searchServices.fetchSearchProduct(context: context, search: widget.serachQuery);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return productList == null?Center(child: CircularProgressIndicator(),):Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              SizedBox(
                height: 60,
                child: Image.asset('images/proIcon2.png'),
              ),
            ],
          ),
        ),
        body: productList == null?Center(child: CircularProgressIndicator(),):Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text("Search Result for ${widget.serachQuery}",style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ,color: Colors.grey),),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height*0.8,
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: productList?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.52,mainAxisSpacing: 15,crossAxisSpacing: 10),
                      itemBuilder: (context,index){
                        final product=productList?[index];
                        double totalRating=0;
                        for(int i=0;i<product!.rating!.length;i++){
                          totalRating+=product.rating![i].Rating;
                          if(product.rating![i].userId==Provider.of<UserProvider>(context,listen: false).user.id){
                            myRating=product.rating![i].Rating;
                          }
                          if(totalRating!=0){
                            avgRating=totalRating/product.rating!.length;
                          }
                        }
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(product: product)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 230,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                      child: Image.network(product!.image[0],fit: BoxFit.cover,)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text("BabuMoshai®",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.024,color: Colors.grey),),

                                      Icon(Icons.favorite,size: 15,)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(product.name,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.022),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 5),
                                  child: RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: '₹ ${product.price}',style: TextStyle(color: Colors.black)),
                                        TextSpan(text: '     ₹ ${product.maxPrice}',style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.width*0.025)),
                                        TextSpan(text: '                  ${product.offer}% off',style: TextStyle(color: Colors.green))
                                      ]
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 5,right: 10),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      StarRetting(ratting: avgRating),
                                      RichText(text: TextSpan(
                                          children: [
                                            product.quantity<0?TextSpan(text: 'Out of Stock!',style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.width*0.02)):TextSpan(text: '${product.quantity} left!',style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.02)),
                                          ]
                                      )),
                                    ],
                                  )
                                )

                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),

    );
  }
}
