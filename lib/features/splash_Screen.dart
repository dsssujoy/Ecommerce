import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suchi/features/admin/screen/admin_screen.dart';
import 'package:suchi/features/auth/screens/auth_Screens.dart';
import 'package:suchi/features/auth/services/auth_services.dart';

import '../common/widgets/custom_bottom_bar.dart';
import '../providers/user_provider.dart';
import 'home/home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService=AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    // Navigate to the AuthScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type=='user'?BottomBar():AdminScreen()
            : AuthScreens()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash.jpg"), // Ensure the correct path
            fit: BoxFit.cover,
          ),
        ),

      ),
    );
  }
}



