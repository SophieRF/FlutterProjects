  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleDrinkName extends StatelessWidget{
  final String drinkName;
  const TitleDrinkName({super.key, required this.drinkName});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 370.sp,
            height: 40.sp,
            color: const Color.fromARGB(185, 0, 0, 0),
            child: Padding(
              padding: EdgeInsets.only(left:3.0.sp),
              child: Text(
                drinkName,
                style: TextStyle(
                  fontFamily: "Michroma-Regular",
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(blurRadius: 2.0, color: Colors.black, offset: Offset(4.0, 4.0),)]
                ),
              ),
            ),
          );
  }
}