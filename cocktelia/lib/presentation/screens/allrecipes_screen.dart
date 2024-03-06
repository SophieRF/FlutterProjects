import 'package:cocktelia/models/categorycards_model.dart';
import 'package:cocktelia/models/recipecards_model.dart';
import 'package:cocktelia/presentation/widgets/recipeCard/changeNotifier/recipecards_provider.dart';
import 'package:cocktelia/presentation/screens/favorites_screen.dart';
import 'package:cocktelia/presentation/widgets/recipeCard/recipes_grid.dart';
import 'package:cocktelia/presentation/widgets/tab_bar.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AllRecipesScreen extends StatelessWidget{
  final CategoryCardModel selectedCategory;
  const AllRecipesScreen({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
  Provider.of<RecipeCardProvider>(context).loadAllRecipes();
  List<RecipeCardModel> filteredRecipes = Provider.of<RecipeCardProvider>(context).getRecipesByCategory(selectedCategory.categoryName);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 110),
          child: TabAppBar(tabCategory: 'Recetas'),
          ),
        body: TabBarView(
          children: [
            //Container de fondo
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkBrown,
                    lightBrown,
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                ),
              ),
              alignment: Alignment.center,
              //Grilla de recetas
              child: RecipesGrid(recipes: filteredRecipes),
            ),
            //Tab de la otra pestaña
            const FavoritesMenu(),
          ],
        ),
      ),
    );
  }
}