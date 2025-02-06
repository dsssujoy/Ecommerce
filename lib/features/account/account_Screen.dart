import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suchi/common/widgets/customButton.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/features/account/widget/account_button.dart';
import 'package:suchi/features/account/widget/account_setting.dart';
import 'package:suchi/features/account/widget/top_Button.dart';
import 'package:suchi/features/home/widget/search_Home.dart';
import 'package:suchi/providers/user_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgProduct.jpg"), // Ensure correct path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: double.infinity,
                color: GlobalVariable.customGreen,
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
                          child: Image.asset('images/proIcon.png'),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.notifications, size: 30, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchHome()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.search, size: 30, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Hello, ${user.name}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const TopButton(),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Account Setting",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, color: Colors.black),
                ),
              ),
              const AccountSetting(),
              const SizedBox(height: 65),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Buy something to get", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    const Text("personalised recommendations", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccountButton(text: 'Keep Shopping', onPresed: (){}, icon: Icon(Icons.shopping_bag),),
                  SizedBox(height: 160,
                    child: Image.asset('images/bagShopping.png'),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
