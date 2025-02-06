import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:suchi/common/widgets/customButton.dart';
import 'package:suchi/common/widgets/customTextFild.dart';
import 'package:suchi/features/admin/services/admin_services.dart';
import '../../../../constants/global_variable.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController productQuantity = TextEditingController();
  final TextEditingController productMaxprice = TextEditingController();
  final TextEditingController productOffer = TextEditingController();

  final _addProductFormKey = GlobalKey<FormState>();
  final AdminServices adminServices = AdminServices();

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && image.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productName.text,
        description: productDescription.text,
        price: double.parse(productPrice.text),
        quantity: int.parse(productQuantity.text),
        catagory: defaultCat,
        image: image,
        Maxprice: double.parse(productMaxprice.text),
        Offer: double.parse(productOffer.text),
        sizes: selectedSizes, // Passing selected sizes
      );
    }
  }

  String defaultCat = 'Men';
  List<String> productCat = ['Special', 'Men', 'Women', 'Hoodie', 'Bengali'];

  List<File> image = [];
  List<String> clothSize = ['S', 'M', 'L', 'XL', 'XXL'];
  List<String> selectedSizes = [];

  Future<void> selectImage() async {
    try {
      var res = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (res != null && res.files.isNotEmpty) {
        setState(() {
          image = res.files.map((file) => File(file.path!)).toList();
        });
      }
    } catch (e) {
      debugPrint("Error picking images: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    productName.dispose();
    productDescription.dispose();
    productPrice.dispose();
    productQuantity.dispose();
    productMaxprice.dispose();
    productOffer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariable.customGreen,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 60, child: Image.asset('images/proIcon.png')),
              const Text("Add Items", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _addProductFormKey,
            child: Column(
              children: [
                image.isNotEmpty
                    ? CarouselSlider(
                  items: image.map((file) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(file, fit: BoxFit.cover, width: double.infinity),
                    );
                  }).toList(),
                  options: CarouselOptions(height: 200, viewportFraction: 1),
                )
                    : GestureDetector(
                  onTap: selectImage,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(30),
                    dashPattern: [10, 4],
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.folder_copy_outlined, size: 50, color: GlobalVariable.customGreen),
                          const SizedBox(height: 20),
                          Text("Select Product Image", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03, color: GlobalVariable.customGreen)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Customtextfild(controller: productName, HintText: 'Product Name'),
                const SizedBox(height: 30),
                Customtextfild(controller: productDescription, HintText: 'Product Description', maxLine: 8),
                const SizedBox(height: 30),
                Customtextfild(controller: productPrice, HintText: 'Product Price'),
                const SizedBox(height: 30),
                Customtextfild(controller: productQuantity, HintText: 'Product Quantity'),
                const SizedBox(height: 20),
                Customtextfild(controller: productMaxprice, HintText: 'Product Max Price'),
                const SizedBox(height: 20),
                Customtextfild(controller: productOffer, HintText: 'Product Offer'),
                const SizedBox(height: 20),
                Wrap(
                  children: clothSize.map((size) {
                    bool isSelected = selectedSizes.contains(size);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected ? selectedSizes.remove(size) : selectedSizes.add(size);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: Text(size, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: defaultCat,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  ),
                  items: productCat.map((String category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      defaultCat = newValue!;
                    });
                  },
                ),
                CustomButton(text: 'Sell', onPresed: sellProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}