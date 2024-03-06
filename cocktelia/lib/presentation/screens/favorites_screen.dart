import 'package:cocktelia/presentation/screens/recipeScreen/recipe_screen.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';

class FavoritesMenu extends StatelessWidget {
  const FavoritesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeScreenProvider>(
      builder: (context, recipeProvider, _) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 23, 15),
                Color.fromARGB(255, 66, 57, 50),
              ],
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
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
                  padding: const EdgeInsets.only(top:10),
                  child: Card(
                    elevation: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(myFavRecipe.drinkImage),
                              fit: BoxFit.cover), 
                          ),
                          width: 104,
                          height: 104,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(myFavRecipe.drinkName, style: textStyleBase.paragraph24Dark),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            recipeProvider.removeFavorite(myFavRecipe);
                            },
                          icon:const Icon(Icons.delete, size: 34, color: Colors.black87,)),
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
/*import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesMenu extends StatelessWidget{
  const FavoritesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<RecipeScreenProvider>(context).favoriteRecipes;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Color.fromARGB(255, 31, 23, 15),
          Color.fromARGB(255, 66, 57, 50),
          ],
          begin: Alignment.topCenter, 
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
      ),
      child: ListView.builder(
        itemCount: favorite.length,
        itemBuilder: (_, index) {
          var myFavRecipe = favorite[index];
          return Card(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(myFavRecipe.drinkImage),
                      fit: BoxFit.cover), 
                  ),
                  width: 90,
                  height: 90,
                ),
                Text(myFavRecipe.drinkName),
              ],
            ),
          ); 
        },
      ),
    );
  }
}*/