import 'package:auction_app/controllers/authController.dart';
import 'package:flutter/material.dart';

import '../models/user.model.dart';

class UserProfilePage extends StatelessWidget {


  UserProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      final UserModel user =  AuthController.instance.getUserData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile' , style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Name: ${user.firstName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,),
            ),
            const SizedBox(height: 8),
            Text(
              'Last Name: ${user.lastName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: ${user.phone}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,),
            ),
            const SizedBox(height: 8),
            Text(
              'CIN: ${user.cin}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,),
            ),
           ElevatedButton(onPressed: (){
            AuthController.instance.signOut();
           }, child: const Text("Logout" , style:  TextStyle(color:Colors.white),))
          ],
        ),
      ),
    );
  }
}
