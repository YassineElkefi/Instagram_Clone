import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/cupertino/cupertino_login_screen.dart';
import 'package:provider/provider.dart';

class CupertinoHomeScreen extends StatelessWidget {
  const CupertinoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CupertinoPageScaffold(
      //backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        leading: Text('Instagram',
         style: TextStyle(
          fontFamily: 'InstagramSans',
          fontWeight: FontWeight.bold,
          fontSize: 30
          )),
        trailing: CupertinoButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (context) => CupertinoLoginScreen()),
            );
          },
          child: Icon(
            CupertinoIcons.escape,
            color: themeProvider.themeMode == ThemeMode.light
                ? CupertinoColors.black
                : CupertinoColors.white,
            size: 25,
          ),
        ),

      ),
      child: Center(
        child: Text("welcome".tr(), style: TextStyle(color: CupertinoColors.white)),
      )
    );
  }
}