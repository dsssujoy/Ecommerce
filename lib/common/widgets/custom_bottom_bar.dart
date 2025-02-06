import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:suchi/features/account/account_Screen.dart';
import 'package:suchi/features/home/home_Screen.dart';
import 'package:suchi/features/home/services/product_services.dart';
import 'package:suchi/model/getAppProduct.dart';
import 'package:suchi/providers/user_provider.dart';
import '../../constants/global_variable.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});


  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 1;
  List<Widget> pages=[
    AccountScreen(),
    HomeScreen(),
    Center(child: Text("Cart"),)
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    final userCartLen=context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        height: 60,
        child: ClipRRect(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: BottomNavigationBar(
              currentIndex: _page,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: GlobalVariable.customGreen,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              onTap: updatePage,
              items: [
                // Account
                BottomNavigationBarItem(
                  icon: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.account_box_outlined),
                  ),
                  label: 'Account',
                ),
                // Home
                BottomNavigationBarItem(
                  icon: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.home_outlined),
                  ),
                  label: 'Home',
                ),
                // Cart
                BottomNavigationBarItem(
                  icon: badges.Badge(
                    position: badges.BadgePosition.topEnd(end: -3),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: GlobalVariable.customGreen
                    ),
                    badgeContent: Text('${userCartLen.toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                        Icon(Icons.add_shopping_cart),

                    ),
                  ),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
