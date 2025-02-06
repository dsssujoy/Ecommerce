import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/features/auth/screens/auth_Screens.dart';
import 'package:suchi/features/auth/services/auth_services.dart';
import 'package:suchi/features/home/home_Screen.dart';
import 'package:suchi/features/splash_Screen.dart';
import 'package:suchi/providers/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider())
  ],
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService=AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BabuMoshai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: GlobalVariable.customGreen,foregroundColor: Colors.white),
          ),
          appBarTheme: AppBarTheme(
          elevation: 0,
            iconTheme: IconThemeData(
              color:GlobalVariable.customWhite
            )
      )
      ),
      home:SplashScreen(),
    );
  }
}


