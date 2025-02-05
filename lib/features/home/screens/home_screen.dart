import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/features/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Instagram', style: TextStyle(color: Colors.white, fontFamily: 'InstagramSans', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white,),
            onPressed: (){
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
          )
        ],
        ),
      body: Center(
        child: Text("Welcome to Instagram", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}