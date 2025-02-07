import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_register_screen.dart';
import 'package:instagram_clone/features/home/screens/material/material_home_screen.dart';
import 'package:instagram_clone/shared/language_selector.dart';
import 'package:provider/provider.dart';

class MaterialLoginScreen extends StatefulWidget {
  const MaterialLoginScreen({super.key});

  @override
  State<MaterialLoginScreen> createState() => _MaterialLoginScreenState();
}

class _MaterialLoginScreenState extends State<MaterialLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLanguageSelected(Language language) {
    if (language.name == 'Français') {
      context.setLocale(Locale('fr'));
    } else if (language.name == 'English') {
      context.setLocale(Locale('en'));
    } else if (language.name == 'تونسي') {
      context.setLocale(Locale('ar', 'TN'));
    }
  }

  void _login(BuildContext context){
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(_emailController.text.trim(), _passwordController.text.trim());

    if(authProvider.isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MaterialHomeScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email or password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //Language selector
              Row(
                children: [
                  //Theme Switcher
                  IconButton(onPressed: (){
                    themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
                  }, icon: Icon(themeProvider.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode)),
                  Expanded(child: SizedBox()),
                  LanguageSelector(
                    onLanguageSelected: _onLanguageSelected,
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Instagram Logo
                        Text(
                          "Instagram",
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: 50,
                            fontFamily: 'InstagramSans',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40),
                        //Email Field
                        TextField(
                          controller: _emailController,
                          style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Email'.tr(),
                            //hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            //fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none
                            )
                          ),
                        ),
                        SizedBox(height: 16),
                        //Password Field
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Password'.tr(),
                            //hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            //fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        //Forgot Password
                        Row(children: [
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: (){},
                            child: Text("Forgot Password?".tr(), style: TextStyle(color: Colors.blue),),
                          )
                        ],),
                        SizedBox(height: 16),
                        //Login Button
                        FilledButton(
                          onPressed: () => _login(context),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            backgroundColor: Colors.blue,
                            minimumSize: Size(double.infinity, 48),
                          ),
                          child: Text("Login".tr(), style: TextStyle(color: Colors.white),),
                        ),
                        
                        SizedBox(height: 16),
                        
                        //Continue with Facebook
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("OR".tr(), style: TextStyle(color: Colors.grey),),
                            ),
                            Expanded(child: Divider(color: Colors.grey)),
                          ],
                        ),
                  
                        SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: (){},
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                          ),
                          icon: Icon(Icons.facebook, color: Colors.blue, size: 25,),
                          label: Text("Continue with Facebook".tr(), style: TextStyle(color: Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Sign Up Section at bottom
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MaterialRegisterScreen()));
                    },
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Text("Don't have an account?".tr(), style: TextStyle(color: Colors.grey),),
                        SizedBox(width: 4),
                        Text("Sign Up".tr(), style: TextStyle(color: Colors.blue),),
                        Expanded(child: SizedBox()),
                      ]
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      )
    );
  }
}