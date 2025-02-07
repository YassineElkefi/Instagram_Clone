import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/cupertino/cupertino_login_screen.dart';
import 'package:instagram_clone/features/home/screens/cupertino/cupertino_home_screen.dart';
import 'package:provider/provider.dart';

class CupertinoRegisterScreen extends StatefulWidget {
  const CupertinoRegisterScreen({super.key});

  @override
  _CupertinoRegisterScreenState createState() =>
      _CupertinoRegisterScreenState();
}

class _CupertinoRegisterScreenState extends State<CupertinoRegisterScreen> {
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
        CupertinoPageRoute(builder: (context) => CupertinoHomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CupertinoPageScaffold(
      child: SafeArea(
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
                  ),
                ),
                SizedBox(height: 20),
                // Register text
                Text(
                  "Sign up to see photos and videos from your friends.".tr(),
                  textAlign: TextAlign.center,
                  
                ),
                SizedBox(height: 15),

                // Facebook Button
                CupertinoButton.filled(
                  //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: CupertinoColors.white),
                      SizedBox(width: 8),
                      Text(
                        "Log in with Facebook".tr(),
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Or Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: CupertinoColors.systemGrey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR".tr(),
                        style: TextStyle(
                            color: CupertinoColors.systemGrey, fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: CupertinoColors.systemGrey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Email field
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  controller: emailController,
                  style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                  placeholder: "Mobile Number or Email".tr(),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 16),
                // Name field
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  controller: nameController,
                  style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                  placeholder: "Full Name".tr(),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 16),
                // Username field
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  controller: usernameController,
                  style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                  placeholder: "Username".tr(),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 16),
                // Password field
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  controller: passwordController,
                  obscureText: true,
                  style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                  placeholder: "Password".tr(),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 20),

                // Signup Button
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: () => _signup(context),
                    child: Text("Sign Up".tr(),
                        style: TextStyle(
                            color: CupertinoColors.white, fontSize: 16)),
                  ),
                ),
                SizedBox(height: 16),
                // Terms and Privacy Policy
                Text(
                  "By signing up, you agree to our Terms, Data Policy and Cookies Policy.".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CupertinoColors.systemGrey, fontSize: 15),
                ),
                SizedBox(height: 20),
                // Simulate the end of a card and then same sized box and then another card
                Container(
                  height: 1,
                  color: CupertinoColors.systemGrey,
                ),
                SizedBox(height: 20),
                // Already have an account? Log In
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?".tr(),
                        style: TextStyle(
                            color: CupertinoColors.systemGrey, fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CupertinoLoginScreen()),
                          );
                        },
                        child: Text(
                          "Log In".tr(),
                          style: TextStyle(
                              color: CupertinoColors.activeBlue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
