import 'package:cocktelia/models/categorycards_model.dart';
import 'package:cocktelia/presentation/screens/allrecipes_screen.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget{
  final CategoryCardModel categoryCards;
  final String? selectedCategory;

const CategoryCard({
  super.key,
  required this.categoryCards,
  this.selectedCategory});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    //InkWell para que al presionar nos dirija a AllRecipesScreen
    return InkWell(
      onTap: ()=>{
        setState(() {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=> AllRecipesScreen(
                selectedCategory: widget.categoryCards)));
        })
      },
      //Cuerpo
      child: Container(
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            //Imagen de fondo
            Positioned.fill(
              child: Image.network(
                widget.categoryCards.categoryImage,
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
            top: 80,
            left: 18,
              child: Text(
                widget.categoryCards.categoryName,
                style: textStyleBase.h120,
              ),
            ),
          ],
        )
      ),
    );
  }
}