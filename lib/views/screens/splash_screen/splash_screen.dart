import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/views/screens/bottom_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Get.offAll(()=> const BottomNavbarScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("U R B A N      C U L T U R E"),
      ),
    );
  }
}
