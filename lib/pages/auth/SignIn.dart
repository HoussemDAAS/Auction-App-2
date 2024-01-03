// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:auction_app/controllers/authController.dart';
import 'package:auction_app/pages/auth/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _emailController;
  TextEditingController? _passwordController;


  @override
  void initState() {
    super.initState();
   
    _emailController = TextEditingController();
    
    _passwordController = TextEditingController();

  }

  @override
  void dispose() {

    _emailController?.dispose();

    _passwordController?.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Lottie.asset('assets/login.json' , height: 250 , width: 250 ),
                const Text(
                  "Login   ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(onPressed: 
                    (){
                    
                      Get.off(()=>SignUpPage());
                    }, child: const Text("Create one" , style: TextStyle(fontSize: 16),))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black), // Text color
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    // Add email validation logic if needed
                    return null;
                  },
                ),
               
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black), // Text color
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a password';
                    }
                    // Add password strength validation logic if needed
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
               SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {
                AuthController.instance.loginUser(_emailController!.text.trim(), _passwordController!.text.trim());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: const Text('Sign In' , style: TextStyle(color: Colors.white),),
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
