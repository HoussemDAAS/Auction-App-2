
// ignore_for_file: file_names

import 'package:auction_app/pages/auth/SignIn.dart';
import 'package:auction_app/pages/auth/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/money.jfif',
            scale: 1.2,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Hello , welcome!',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
          ),
          const Text('Log in or create account'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=> SignUpPage());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child:  const Text('Register'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>  SignInPage() );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 124, 124, 124),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: const Text('Login'),
            ),
          ),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {},
              
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                elevation: 0
              ),
              child:  const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple , color: Colors.black,) , 
                  SizedBox(width: 5,),
                  Text(
                'Continue with Apple',
                style: TextStyle(color: Colors.black),
              ),

                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
                side: const BorderSide(color: Colors.black),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook , color: Colors.blue,) , 
                  SizedBox(width: 5,),
                  Text(
                'Continue with Facebook',
                style: TextStyle(color: Colors.black),
              ),

                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
