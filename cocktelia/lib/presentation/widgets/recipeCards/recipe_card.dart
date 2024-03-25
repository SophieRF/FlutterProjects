import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeCard extends StatelessWidget {
  final String recipeName;
  final String recipeImage;
  const RecipeCard({
    super.key, 
    required this.recipeName,
    required this.recipeImage,
  });
  @override
  Widget build(BuildContext context) {
    final recipeProvider = recipeScreenProvider;
    recipeProvider.loadRecipesFromJson();
    //carta clickable que dirige a la pantalla de receta
    return GestureDetector(
      onTap: () {
        recipeProvider.selectRecipeByName(recipeName);
        final selectedRecipe = recipeProvider.selectedRecipe;
        if (selectedRecipe != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context,) => RecipeScreen(
                drinkImage: recipeImage,
                drinkName: selectedRecipe.drinkName,
                drinkIngredients: selectedRecipe.drinkIngredients,
                howToMake: selectedRecipe.howToMake,
              ),
            ),
          );
        }
      },
      //Cuerpo de la carta
      child: SizedBox(
        width: 182.sp,
        height: 210.sp,
        child:
            Padding(
              padding: EdgeInsets.only(right: 14.sp),
              child: Column(
                children: [
                //Imagen de fondo
                  Container(
                    width: double.infinity.sp,
                    height: 145.sp,
                    decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(
                        color: Colors.black,
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )],
                      borderRadius: BorderRadius.circular(10.sp),
                      image: DecorationImage(
                        image:NetworkImage(recipeImage) ,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                //Texto descriptivo
                  Text(
                    recipeName,
                    style: textStyleBase.paragraph24,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}