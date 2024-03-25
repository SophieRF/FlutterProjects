import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';

class FavoritesMenu extends StatelessWidget {
  const FavoritesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeScreenProvider>(
      builder: (context, recipeProvider, _) {
        return Container(
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
          child: ListView.builder(
            itemCount: recipeProvider.favoriteRecipes.length,
            itemBuilder: (_, index) {
              var myFavRecipe = recipeProvider.favoriteRecipes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeScreen(
                        drinkImage: myFavRecipe.drinkImage,
                        drinkName: myFavRecipe.drinkName,
                        drinkIngredients: myFavRecipe.drinkIngredients,
                        howToMake: myFavRecipe.howToMake,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top:10.sp),
                  child: Card(
                    elevation: 20.0.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage(myFavRecipe.drinkImage),
                              fit: BoxFit.cover), 
                          ),
                          width: 104.sp,
                          height: 104.sp,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.sp),
                            child: Text(myFavRecipe.drinkName, style: textStyleBase.paragraph24Dark),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            recipeProvider.removeFavorite(myFavRecipe);
                            },
                          icon:Icon(Icons.delete, size: 34.sp, color: Colors.black87,)),
                      ],
                    ),
                  ),
                ),
              ); 
            },
          ),
        );
      },
    );
  }
}