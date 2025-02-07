import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/core/providers/theme_provider.dart';
import 'package:instagram_clone/features/auth/screens/cupertino/cupertino_login_screen.dart';
import 'package:instagram_clone/features/auth/screens/material/material_login_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('fr'),
        Locale('ar', 'TN'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: AppLauncher(),
    )
      )
    
  );
}

class AppLauncher extends StatelessWidget{
  const AppLauncher({super.key});

  @override
  Widget build(BuildContext context){
    return Platform.isIOS ? MyCupertinoApp() : MyMaterialApp();
  }
}


class MyMaterialApp extends StatelessWidget{
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200], // Light gray background for text fields
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[100], // Light gray background for cards
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white),
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800], // Dark gray background for text fields
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
      home: MaterialLoginScreen(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget{
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: isDarkMode ? CupertinoColors.black : CupertinoColors.white,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: isDarkMode ? CupertinoColors.white : CupertinoColors.black),
        ),
      ),
      home: CupertinoLoginScreen(),
    );
  }
}