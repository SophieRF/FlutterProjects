  import 'package:cocktelia/presentation/screens/recipeScreen/model/recipescreen_model.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget{
  final String drinkImage;
  final String drinkName;
  final String drinkIngredients;
  final String howToMake;

  const FavoriteButton({super.key, required this.drinkImage, required this.drinkName, required this.drinkIngredients, required this.howToMake});

  @override
  Widget build(BuildContext context) {
    final isFavorite = recipeScreenProvider.favoriteRecipes.any((recipe) => recipe.drinkName == drinkName);
    return Consumer<RecipeScreenProvider>(
                  builder: (context, recipeScreenProvider, _) {
                    final isFavorite = recipeScreenProvider.favoriteRecipes.any((recipe) => recipe.drinkName == drinkName);
                    return Padding(
                      padding: EdgeInsets.only(right: 20.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5.sp,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                              spreadRadius: 5.sp,
                              blurRadius: 7.sp,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        // Boton de estrella para agregar a favoritos:
                        child: IconButton(
                          onPressed: () {
                            final recipe = RecipeScreenModel(
                              drinkImage: drinkImage,
                              drinkName: drinkName,
                              drinkIngredients: drinkIngredients,
                              howToMake: howToMake,
                            );
                            if (isFavorite) {
                              recipeScreenProvider.removeFavorite(recipe);
                            } else {
                              recipeScreenProvider.addIntoFavorites(recipe);
                            }
                          },
                          icon: isFavorite
                              ? Icon(Icons.star, size: 34.sp, color: const Color.fromARGB(255, 255, 187, 0))
                              : Icon(Icons.star_border_outlined, size: 34.sp, color: const Color.fromARGB(255, 255, 187, 0),),
                        ),
                      ),
                    );
                  },
                );
  }

}