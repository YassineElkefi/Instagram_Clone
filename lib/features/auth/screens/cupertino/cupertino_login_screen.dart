import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/cupertino/cupertino_register_screen.dart';
import 'package:instagram_clone/features/home/screens/cupertino/cupertino_home_screen.dart';
import 'package:instagram_clone/shared/language_selector.dart';
import 'package:provider/provider.dart';

class CupertinoLoginScreen extends StatefulWidget {
  const CupertinoLoginScreen({super.key});

  @override
  State<CupertinoLoginScreen> createState() => _CupertinoLoginScreenState();
}

class _CupertinoLoginScreenState extends State<CupertinoLoginScreen> {
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
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> CupertinoHomeScreen()));
    }else{
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('Invalid email or password'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CupertinoPageScaffold(
      //backgroundColor: CupertinoColors.black,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              
              Row(
                children: [
                  //Theme selector
                  CupertinoButton(onPressed: (){
                    themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
                  },
                  child: Icon(themeProvider.themeMode == ThemeMode.light ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max),
                  ),
                  Expanded(child: SizedBox()),
                  //Language selector
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
                            fontSize: 50,
                            fontFamily: 'InstagramSans',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40),
                        //Email Field
                        CupertinoTextField(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          controller: _emailController,
                          style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                          placeholder: 'Email'.tr(),
                          placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(height: 16),
                        //Password Field
                        CupertinoTextField(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          controller: _passwordController,
                          obscureText: true,
                          style: themeProvider.themeMode == ThemeMode.dark ? TextStyle(color: CupertinoColors.white) : TextStyle(color: CupertinoColors.black),
                          placeholder: 'Password'.tr(),
                          placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(height: 10),
                        //Forgot Password
                        Row(children: [
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: (){},
                            child: Text("Forgot Password?".tr(), style: TextStyle(color: CupertinoColors.activeBlue),),
                          )
                        ],),
                        SizedBox(height: 16),
                        //Login Button
                        SizedBox(
                          width: double.infinity,
                          child: CupertinoButton.filled(
                            onPressed: () => _login(context),
                            child: Text("Login".tr(), style: TextStyle(color: CupertinoColors.white),),
                          ),
                        ),
                        
                        SizedBox(height: 16),
                        
                        //Continue with Facebook
                        Row(
                          children: [
                            Expanded(child: Divider(color: CupertinoColors.systemGrey)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("OR".tr(), style: TextStyle(color: CupertinoColors.systemGrey),),
                            ),
                            Expanded(child: Divider(color: CupertinoColors.systemGrey)),
                          ],
                        ),
                  
                        SizedBox(height: 16),
                        CupertinoButton(
                          onPressed: (){},
                          //color: CupertinoColors.activeBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook, color: CupertinoColors.activeBlue, size: 25,),
                              SizedBox(width: 8),
                              Text("Continue with Facebook".tr(), style: TextStyle(color: CupertinoColors.activeBlue),),
                            ],
                          ),
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
                  Divider(color: CupertinoColors.systemGrey),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> CupertinoRegisterScreen()));
                      },
                      child: Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Text("Don't have an account?".tr(), style: TextStyle(color: CupertinoColors.systemGrey),),
                          SizedBox(width: 4),
                          Text("Sign Up".tr(), style: TextStyle(color: CupertinoColors.activeBlue),),
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