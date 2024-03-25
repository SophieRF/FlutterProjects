import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget{
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/presentation/screens/splashScreen/image/OIG3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
  }

}