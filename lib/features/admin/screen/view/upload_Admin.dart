import 'package:flutter/material.dart';
import 'package:suchi/features/admin/screen/view/add_product_Screen.dart';
import 'package:suchi/features/admin/services/admin_services.dart';
import 'package:suchi/model/getAppProduct.dart';



class UploadAdmin extends StatefulWidget {
  const UploadAdmin({super.key});

  @override
  State<UploadAdmin> createState() => _UploadAdminState();
}

class _UploadAdminState extends State<UploadAdmin> {
  List<GetAllData>? allData;
  final AdminServices adminServices=AdminServices();

  @override
  void initState() {
    super.initState();
    getAllProduct();
  }
  void getAllProduct()async{
    allData=await adminServices.fetchAllProduct(context);
    setState(() {

    });
  }

  void deleteProduct(GetAllData product,int index)async{
    adminServices.deleteProduct(context: context, product: product, onSucessed: (){
      allData!.removeAt(index);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return allData ==null? Center(child: CircularProgressIndicator(),):Scaffold(
      body: GridView.builder(
          itemCount:allData!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.2),
          itemBuilder: (context,index){
            final productData=allData![index];
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: MediaQuery.of(context).size.width*0.54,
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(productData.image[0])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("${productData.name.substring(0,10)}..",overflow: TextOverflow.ellipsis,),
                  InkWell(
                    onTap: (){
                      deleteProduct(productData, index);
                    },
                      child: Icon(Icons.delete))
                  ],
                )
              ],
            );
          }
      ),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add_box_rounded),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
      },tooltip: 'Add a Product',),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
