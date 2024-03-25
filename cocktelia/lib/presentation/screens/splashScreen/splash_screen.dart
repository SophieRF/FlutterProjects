import 'package:cocktelia/presentation/screens/homeScreen/home_screen.dart';
import 'package:cocktelia/presentation/screens/splashScreen/splash_title.dart';
import 'package:cocktelia/presentation/screens/splashScreen/ss_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
        var seconds = const Duration(seconds: 3);
    Future.delayed(seconds, (){
      Navigator.pushAndRemoveUntil(
        context, MyHomePage.route, 
        (route) => false);
  },);
    return Scaffold(
      body: Stack(
        children: [
          const SplashImage(),
          //Texto de presentación
          Positioned(
            top: 56.sp,
            left: 0,
            right: 0,
            child: const SplashTitle(),
          ),
        ],
      ),
    );
  }
}
