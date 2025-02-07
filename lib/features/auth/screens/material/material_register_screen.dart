import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_login_screen.dart';
import 'package:instagram_clone/features/home/screens/material/material_home_screen.dart';
import 'package:provider/provider.dart';

class MaterialRegisterScreen extends StatefulWidget {
  const MaterialRegisterScreen({super.key});

  @override
  _MaterialRegisterScreenState createState() => _MaterialRegisterScreenState();
}

class _MaterialRegisterScreenState extends State<MaterialRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signup(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(emailController.text, passwordController.text);

    if (authProvider.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MaterialHomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Instagram logo
                Text(
                  "Instagram",
                  style: TextStyle(
                    fontFamily: 'InstagramSans',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    //color: CupertinoColors.white,
                  ),
                ),
                SizedBox(height: 20),
                // Register text
                Text(
                  "Sign up to see photos and videos from your friends.".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),

                // Facebook Button
                FilledButton(onPressed: (){},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue, minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Log in with Facebook".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
                ),
                SizedBox(height: 20),
                //Or Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR".tr(),
                        style: TextStyle(color: Colors.grey, fontSize: 15 ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Email field
                TextField(
                  controller: emailController,
                  style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: "Mobile Number or Email".tr(),
                    //hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    //fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Name field
                TextField(
                  controller: nameController,
                  style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: "Full Name".tr(),
                    //hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    //fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Username field
                TextField(
                  controller: usernameController,
                  style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: "Username".tr(),
                    //hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    //fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Password field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: "Password".tr(),
                    //hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    //fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
          
                // Signup Button
                FilledButton(
                  onPressed: () => _signup(context),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Sign Up".tr(), style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                SizedBox(height: 16),
                // Terms and Privacy Policy
                Text(
                  "By signing up, you agree to our Terms, Data Policy and Cookies Policy.".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(height: 20),
                // Simulate the end of a card and then samm sizedbox and then another card
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                // Already have an account? Log In
                Card(
                  //color: Colors.grey[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?".tr(),
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MaterialLoginScreen()),
                            );
                          },
                          child: Text(
                            "Login".tr(),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
