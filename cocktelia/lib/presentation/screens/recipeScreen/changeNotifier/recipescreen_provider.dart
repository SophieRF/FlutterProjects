import 'dart:convert';
import 'package:cocktelia/models/recipescreen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeScreenProvider extends ChangeNotifier{
  
  RecipeScreenModel? _selectedRecipe;
  final List<RecipeScreenModel> _favoriteRecipes = [];
  List<RecipeScreenModel> _recipes = [];

  List<RecipeScreenModel> get favoriteRecipes => _favoriteRecipes;
  List<RecipeScreenModel> get recipes => _recipes;
  RecipeScreenModel? get selectedRecipe => _selectedRecipe;

  // Actualiza _selectedRecipe con el valor en donde coincidan los nombres de los datos:
  void selectRecipeByName(String recipeName) {
    _selectedRecipe = _recipes.firstWhere(
      (recipe) => recipe.drinkName == recipeName);
      notifyListeners();
    }
  //Se cargan los datos del Json, se parsea a Map y luego se almacena como lista de objetos en _recipes:
  Future<void> loadRecipesFromJson() async {
    final String data = await rootBundle.loadString("assets/data/jsonRecipeScreen.json");
    final Map<String, dynamic> jsonResult = json.decode(data);
    final List<dynamic> jsonRecipes = jsonResult["recipeScreen"];
    _recipes = jsonRecipes.map((json) => RecipeScreenModel.fromJson(json)).toList();
    notifyListeners();
  }
  //Agregar receta a favoritos:
  void addIntoFavorites(RecipeScreenModel favRecipe) {
  if (!_favoriteRecipes.any((recipe) => recipe.drinkName == favRecipe.drinkName)) {
    _favoriteRecipes.add(favRecipe);
    notifyListeners();
  }
}
  //Eliminar receta de favoritos:
  void removeFavorite(RecipeScreenModel dropRecipe) {
    _favoriteRecipes.removeWhere((recipe) => recipe.drinkName == dropRecipe.drinkName);
    notifyListeners();
  }
}
final recipeScreenProvider = RecipeScreenProvider();