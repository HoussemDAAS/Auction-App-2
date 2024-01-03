
import 'package:auction_app/controller-bindings.dart';
import 'package:auction_app/firebase_options.dart';
import 'package:auction_app/pages/auth/firstPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    initialBinding: ControllereBindings(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange
    ),
      home: const AuthMain(),
    );
  }
}
