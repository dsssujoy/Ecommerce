import 'package:flutter/material.dart';
import 'package:suchi/common/widgets/customButton.dart';
import 'package:suchi/common/widgets/customTextFild.dart';
import 'package:suchi/constants/global_variable.dart';
import 'package:suchi/features/auth/services/auth_services.dart';


enum Auth{
  signIn,
  signUp
}

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  Auth _auth=Auth.signUp;
  final _signUpFormKey=GlobalKey<FormState>();
  final _signInFormKey=GlobalKey<FormState>();
  final AuthService authService=AuthService();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  void signUpUser(){
    authService.singnUpUser(context: context, email: _emailController.text, name: _nameController.text, password: _passwordController.text );
  }
  void signInUser(){
    authService.singnInUser(context: context, email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("./images/bgProduct.jpg"),fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:30,horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ListTile(
                    title: Text("Create An Account!",style: TextStyle(fontSize: 20),),
                    leading: Radio(activeColor: GlobalVariable.customGreen,value: Auth.signUp, groupValue: _auth, onChanged: (Auth? val){
                      setState(() {
                        _auth=val!;
                      });
                    }),
                  ),
                  if(_auth==Auth.signUp)
                    Form(
                      key: _signUpFormKey,
                        child: Column(
                          children: [
                            SizedBox(height: 100,),
                            Customtextfild(controller: _nameController, HintText: 'Name',),
                            SizedBox(height: 30,),
                            Customtextfild(controller: _emailController, HintText: 'Email',),
                            SizedBox(height: 30,),
                            Customtextfild(controller: _passwordController, HintText: 'Password',),
                            SizedBox(height: 40,),
                            CustomButton(text: 'Sign Up', onPresed: (){
                              if(_signUpFormKey.currentState!.validate()){
                                signUpUser();
                              }
                            }),
                            SizedBox(height: 60,),
            
                          ],
                        )),
                  ListTile(
                    title: Text("Log in!",style: TextStyle(fontSize: 20),),
                    leading: Radio(activeColor: GlobalVariable.customGreen,value: Auth.signIn, groupValue: _auth, onChanged: (Auth? val){
                      setState(() {
                        _auth=val!;
                      });
                    }),
                  ),
                  if(_auth==Auth.signIn)
                    Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            SizedBox(height: 60,),
                            Customtextfild(controller: _emailController, HintText: 'Email',),
                            SizedBox(height: 30,),
                            Customtextfild(controller: _passwordController, HintText: 'Password',),
                            SizedBox(height: 40,),
                            CustomButton(text: 'Log In', onPresed: (){
                              if(_signInFormKey.currentState!.validate()){
                                signInUser();
                              }
                            }),
                            SizedBox(height: 60,),
            
                          ],
                        )),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
