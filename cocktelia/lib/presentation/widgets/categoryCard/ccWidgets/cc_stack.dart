import 'package:cocktelia/presentation/widgets/categoryCard/model/categorycards_model.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardStack extends StatelessWidget{
  const CategoryCardStack({super.key, required this.categoryCards, this.selectedCategory});
  final CategoryCardModel categoryCards;
  final String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            //Imagen de fondo
            Positioned.fill(
              child: Image.network(
                categoryCards.categoryImage,
                fit: BoxFit.cover, 
                alignment: Alignment.centerRight,
              ),
            ),
            //Gradiente para aplicar sobre la imagen
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(221, 0, 0, 0),
                      Color.fromARGB(167, 0, 0, 0),
                      Color.fromARGB(97, 0, 0, 0), 
                      Color.fromARGB(0, 255, 255, 255)],
                      begin:Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.3, 0.4, 0.5, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            //Texto descriptivo de categoría
            Positioned(
            top: 80.sp,
            left: 18.sp,
              child: Text(
                categoryCards.categoryName,
                style: textStyleBase.h120,
              ),
            ),
          ],
        );
  }

}