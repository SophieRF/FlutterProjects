import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final recipeProvider = Provider.of<RecipeScreenProvider>(context, listen: false);
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
        width: 182,
        height: 210,
        child:
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                //Imagen de fondo
                  Container(
                    width: double.infinity,
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(recipeImage),
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