import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context){
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(_emailController.text.trim(), _passwordController.text.trim());

    if(authProvider.isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email or password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
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
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: 'InstagramSans',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40),
                        //Email Field
                        TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[900],
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[900],
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
                            child: Text("Forgot Password?", style: TextStyle(color: Colors.blue),),
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
                          child: Text("Login", style: TextStyle(color: Colors.white),),
                        ),
                        
                        SizedBox(height: 16),
                        
                        //Continue with Facebook
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("OR", style: TextStyle(color: Colors.grey),),
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
                          label: Text("Continue with Facebook", style: TextStyle(color: Colors.blue),),
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
                    onTap: (){},
                    child: Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(color: Colors.blue),
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