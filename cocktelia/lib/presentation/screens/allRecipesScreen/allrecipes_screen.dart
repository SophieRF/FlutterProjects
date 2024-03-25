import 'package:cocktelia/presentation/widgets/categoryCard/model/categorycards_model.dart';
import 'package:cocktelia/presentation/widgets/recipeCards/model/recipecards_model.dart';
import 'package:cocktelia/presentation/widgets/recipeCards/changeNotifier/recipecards_provider.dart';
import 'package:cocktelia/presentation/screens/favoritesScreen/favorites_screen.dart';
import 'package:cocktelia/presentation/widgets/recipeCards/recipes_grid.dart';
import 'package:cocktelia/presentation/widgets/tabBar/tab_bar.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AllRecipesScreen extends StatelessWidget{
  
  final CategoryCardModel selectedCategory;
  const AllRecipesScreen({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
  recipeCardProvider.loadAllRecipes();
  List<RecipeCardModel> filteredRecipes = recipeCardProvider.getRecipesByCategory(selectedCategory.categoryName);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity.sp, 110.sp),
          child: const TabAppBar(tabCategory: 'Recetas'),
          ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkBrown,
                    lightBrown,
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 1.0],
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