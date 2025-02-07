import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_login_screen.dart';
import 'package:provider/provider.dart';

class MaterialHomeScreen extends StatelessWidget {
  const MaterialHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Instagram', style: TextStyle(fontFamily: 'InstagramSans', fontWeight: FontWeight.bold)),
        //backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.logout,
            color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
            onPressed: (){
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MaterialLoginScreen()));
            },
          )
        ],
        ),
      body: Center(
        child: Text("welcome".tr()),
      ),
    );
  }
}