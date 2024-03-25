import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashTitle extends StatelessWidget{
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('CocktElia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Michroma-Regular",
                fontSize: 54.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                shadows: const [
                  Shadow(
                    color: Colors.black, 
                    offset: Offset(2, 2),
                    blurRadius: 3, 
                  ),
                ],
              ),
            );
  }

}