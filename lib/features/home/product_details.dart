import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:suchi/common/widgets/customButtom_2.dart';
import 'package:suchi/common/widgets/customButton.dart';
import 'package:suchi/common/widgets/custom_bottom_bar.dart';
import 'package:suchi/common/widgets/star_retting.dart';
import 'package:suchi/features/home/services/home_services.dart';
import 'package:suchi/features/home/services/product_services.dart';
import 'package:suchi/features/home/widget/search_Home.dart';
import 'package:suchi/model/getAppProduct.dart';
import 'package:suchi/providers/user_provider.dart';
import '../../constants/global_variable.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final GetAllData product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductServices productServices=ProductServices();
  void addToCart(){
    productServices.addToCart(context: context, product: widget.product);
  }

  String defaultSize="L";
  double avgRating=0;
  double myRating=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double totalRating=0;
    for(int i=0;i<widget.product.rating!.length;i++){
      totalRating+=widget.product.rating![i].Rating;
      if(widget.product.rating![i].userId==Provider.of<UserProvider>(context,listen: false).user.id){
        myRating=widget.product.rating![i].Rating;
      }
      if(totalRating!=0){
        avgRating=totalRating/widget.product.rating!.length;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgProduct.jpg"), // Ensure the correct path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: double.infinity,
                color: GlobalVariable.customWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          child: Image.asset('images/proIcon2.png'),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.black),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHome()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.search, size: 30, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.61,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: CarouselSlider(
                  items: widget.product.image.map((i) {
                    return Builder(
                      builder: (BuildContext context) => ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(i, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width * 1.25,
                    viewportFraction: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BabuMoshai®",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    StarRetting(ratting: avgRating),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product.name,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.black45),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '₹ ${widget.product.price}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '   ₹ ${widget.product.maxPrice}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '   ${widget.product.offer}% OFF',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Inclusive of all Taxes",
                  style: TextStyle(color: Colors.blueGrey, fontSize: MediaQuery.of(context).size.width * 0.025),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.size.length,
                  itemBuilder: (context, index) {
                    bool isSelected = widget.product.size[index] == defaultSize;
                    return GestureDetector(
                      onTap: () {
                        defaultSize = widget.product.size[index];
                        print(defaultSize);
                        setState(() {

                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected ? GlobalVariable.customGreen : Colors.transparent,
                          border: Border.all(
                            color: isSelected ? GlobalVariable.customGreen : Colors.blueGrey,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Text(
                          "${widget.product.size[index]}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Rate the Product",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RatingBar.builder(
                  initialRating: 0,
                    maxRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemBuilder: (context,_){
                      return Icon(Icons.favorite,color: Colors.orange,);
                    },
                    onRatingUpdate: (rating){
                        productServices.reteProduct(context: context, product: widget.product, ratting: rating);
                    }),
              ),
              Custombuttom2(text: "Buy Now", onPresed: (){}),
              Custombuttom2(text: "Add to Cart", onPresed: (){
                addToCart();
              }),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.event_note_outlined),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Description",
                            style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width * 0.03,fontWeight: FontWeight.bold),
                          ),
                          Text("Manufacture, Care and Fit!",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width*0.03),)
                        ],
                      )
                    ],
                  )
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(widget.product.description,textAlign: TextAlign.justify,style: TextStyle(overflow: TextOverflow.clip,fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.black54),),
                ),
              ),
              Container(

                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Divider(color: Colors.grey.shade200,height: 20,thickness: 3,),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.currency_exchange),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2 Days Return!",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold),),
                              Text("Know about Return policy",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width*0.03),)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("⦾ Product can only be returned if the product tag is in good condition, and the box is also intact",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.grey),),
                          SizedBox(height: 5,),
                          Text("⦾ The product must not be damaged. Before accepting the product, please check that it is not damaged",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.grey),),
                          SizedBox(height: 5,),
                          Text("⦾ After delivery, damaged products are non-refundable.",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.grey),),
                          SizedBox(height: 5,),
                          Text("⦾ Returns are only accepted if the product quality does not meet your expectations or the product does not fit properly.",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.grey),),
                          SizedBox(height: 5,),
                          Text("⦾ Reminder: Damaged products are not returnable",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03,color: Colors.grey),),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Divider(color: Colors.grey.shade200,height: 20,thickness: 3,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Image.asset('images/payment.jpg'),
                        ),
                        Text("100% SECURE PAYMENET",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Image.asset('images/shipping.jpg'),
                        ),
                        Text("EASY RETURN & INSTANT REFUND",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Image.asset('images/genuin.jpg'),
                        ),
                        Text("100% GENUIN PRODUCT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                        SizedBox(height: 20,),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }
}
