import 'package:cocktelia/presentation/widgets/recipeCards/model/recipecards_model.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/presentation/widgets/recipeCards/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../screens/recipeScreen/changeNotifier/recipescreen_provider.dart';

class RecipesGrid extends StatelessWidget{
  final List<RecipeCardModel> recipes;
  const RecipesGrid({super.key, required this.recipes});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top:16.0.sp, left: 16.0.sp),
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
/*class RecipesGrid extends StatefulWidget{
  final List<RecipeCardModel> recipes;
  const RecipesGrid({super.key, required this.recipes});

  @override
  State<RecipesGrid> createState() => _RecipesGridState();
}
class _RecipesGridState extends State<RecipesGrid> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final recipeProvider = recipeScreenProvider;
    final recipes = recipeProvider.recipes;
    return GridView.builder(
      padding: EdgeInsets.only(top:26.0.sp,left: 16.0.sp,bottom: 22.0.sp),
      shrinkWrap: true,
      itemCount: widget.recipes.length + (currentPage > 0 ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: ((context, index) {
        if (index == widget.recipes.length) {
          return const Center(child: CircularProgressIndicator()); 
        } else {
        return GestureDetector(
          onTap: () {
            recipeProvider.selectRecipeByName(widget.recipes[index].recipeName);
            final selectedRecipe = recipeProvider.selectedRecipe;
            if (selectedRecipe != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeScreen(
                    drinkImage: widget.recipes[index].recipeImage,
                    drinkName: widget.recipes[index].recipeName,
                    drinkIngredients: selectedRecipe.drinkIngredients,
                    howToMake: selectedRecipe.howToMake,
                  ),
                ),
              );
            }
          },
          child: RecipeCard(
            recipeName: widget.recipes[index].recipeName, 
            recipeImage: widget.recipes[index].recipeImage),
        );}
      }), 
    );
  } 
} */