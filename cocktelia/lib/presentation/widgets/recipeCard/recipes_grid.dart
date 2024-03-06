import 'package:cocktelia/models/recipecards_model.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/presentation/widgets/recipeCard/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/recipeScreen/changeNotifier/recipescreen_provider.dart';

class RecipesGrid extends StatelessWidget{
  final List<RecipeCardModel> recipes;
  const RecipesGrid({super.key, required this.recipes});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top:16.0,left: 16.0),
      shrinkWrap: true,
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            final recipeProvider = Provider.of<RecipeScreenProvider>(context);
            recipeProvider.selectRecipeByName(recipes[index].recipeName);
            final selectedRecipe = recipeProvider.selectedRecipe;

            if (selectedRecipe != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeScreen(
                    drinkImage: recipes[index].recipeImage,
                    drinkName: recipes[index].recipeName,
                    drinkIngredients: selectedRecipe.drinkIngredients,
                    howToMake: selectedRecipe.howToMake,
                  ),
                ),
              );
            }
          },
          child: RecipeCard(
            recipeName: recipes[index].recipeName, 
            recipeImage: recipes[index].recipeImage),
        );
      }), 
    );
  } 
}