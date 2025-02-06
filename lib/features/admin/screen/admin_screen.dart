import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:suchi/features/admin/screen/view/analatic_Admin.dart';
import 'package:suchi/features/admin/screen/view/order_Admin.dart';
import 'package:suchi/features/admin/screen/view/upload_Admin.dart';
import '../../../constants/global_variable.dart';
import 'package:ionicons/ionicons.dart' as icon;

class AdminScreen extends StatefulWidget {
   AdminScreen({super.key});


  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 1;
  List<Widget> pages=[
    OrderAdmin(),
    AnalaticAdmin(),
    UploadAdmin()
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariable.customGreen,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  Text("Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),

            ],
          ),
        ),
      ),
      body: Scaffold(
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
                      child: Icon(icon.Ionicons.bag),
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
                      child: Icon(icon.Ionicons.analytics),
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
                      badgeContent: Text('2',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        Icon(icon.Ionicons.cloud_upload),

                      ),
                    ),
                    label: 'Cart',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
