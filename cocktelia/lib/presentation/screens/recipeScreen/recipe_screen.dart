import 'package:cocktelia/models/recipescreen_model.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
  final String drinkImage;
  final String drinkName;
  final String drinkIngredients;
  final String howToMake;

  const RecipeScreen({
    super.key,
    required this.drinkImage,
    required this.drinkName,
    required this.drinkIngredients,
    required this.howToMake,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Columna que contiene los elementos de la screen
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen ilustrativa en la parte superior
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(drinkImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: 260,
                  ),
                  // Columna de textos
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drinkIngredients,
                          style: textStyleBase.paragraph24,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          howToMake,
                          style: textStyleBase.paragraph24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Texto modo título del nombre del cóctel
              Positioned(
                top: 208,
                left: 12,
                child: Container(
                  width: 360,
                  height: 40,
                  color: Colors.black,
                  child: Text(
                    drinkName,
                    style: const TextStyle(
                      fontFamily: "Michroma-Regular",
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(blurRadius: 2.0, color: Colors.black, offset: Offset(4.0, 4.0),)]
                    ),
                  ),
                ),
              ),
              // Contenedor de botones laterales
              Positioned(
                right: 0,
                top: 236,
                child: Consumer<RecipeScreenProvider>(
                  builder: (context, recipeScreenProvider, _) {
                    final isFavorite = recipeScreenProvider.favoriteRecipes.any((recipe) => recipe.drinkName == drinkName);
                    return SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                                  spreadRadius: 5,
                                  blurRadius: 7,
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
                                  ? const Icon(Icons.star, size: 34, color: Color.fromARGB(255, 255, 187, 0))
                                  : const Icon(Icons.star_border_outlined, size: 34, color: Color.fromARGB(255, 255, 187, 0)),
                            ),
                          ),
                          // Container con estilo de boton
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            // Boton de compartir
                            child: IconButton(
                              onPressed: () {
                                // Opción para compartir receta
                              },
                              icon: const Icon(Icons.share, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*import 'package:cocktelia/models/recipescreen_model.dart';
import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget{
  final int index;
  final String drinkImage;
  final String drinkName;
  final String drinkIngredients;
  final String howToMake;

  const RecipeScreen({super.key,this.index=0,required this.drinkImage, required this.drinkName, required this.drinkIngredients, required this.howToMake});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    var recipeScreenProvider = 
    Provider.of<RecipeScreenProvider>(context, listen: false);
    recipeScreenProvider.loadRecipesFromJson();
    List<RecipeScreenModel> recipes = recipeScreenProvider.recipes;
    RecipeScreenModel recipe = recipes[widget.index];
    
    return Scaffold(
      body:Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child:Stack(
            children: [
              //Column que contiene los elementos de la screen
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //Imagen ilustrativa en la parte superior
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.drinkImage),
                        fit: BoxFit.cover), 
                    ),
                    width: double.infinity,
                    height: 260,
                  ),
                  //Columna de textos
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0, left:20.0, right:20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.drinkIngredients,
                          style: textStyleBase.paragraph20),
                          const SizedBox(height: 14),
                        Text(widget.howToMake,
                          style: textStyleBase.paragraph20),
                      ],
                    ),
                  )
                ],
              ),
                  //Texto modo título del nombre del coctel
                  Positioned(
                    top: 208,
                    left: 12,
                    child: Text(
                      widget.drinkName, 
                      style: textStyleBase.h132),
                  ),
                  //Contenedor de botones laterales
                  Positioned(
                    right: 0,
                    top: 236,
                    //estilo del boton
                    child: Container(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9), 
                                  spreadRadius: 5, 
                                  blurRadius: 7, 
                                  offset: const Offset(4,4), 
                                ),
                              ],
                            ),
                            //Boton de estrella para agregar a favoritos:
                            child: IconButton(
                              onPressed:(){
                                if(recipeScreenProvider.favoriteRecipes.contains(recipe)){
                                  recipeScreenProvider.removeFavorite(recipe);
                                }else{
                                  recipeScreenProvider.addIntoFavorites(recipe);
                                }
                              }, 
                              icon:recipeScreenProvider.favoriteRecipes.contains(recipe)
                              ?const Icon(Icons.star, size: 34, color: Color.fromARGB(255, 255, 187, 0),)
                              :const Icon(Icons.star_border_outlined,size: 34, color: Color.fromARGB(255, 255, 187, 0),
                              ),
                            ),
                          ),
                          //Container con estilo de boton
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9), 
                                  spreadRadius: 5, 
                                  blurRadius: 7, 
                                  offset: const Offset(4,4), 
                                ),
                              ],
                            ),
                            //Boton de compartir
                            child: IconButton(
                              onPressed: (){
                                //Opción para compartir receta
                              }, 
                              icon: const Icon(Icons.share, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
}*/