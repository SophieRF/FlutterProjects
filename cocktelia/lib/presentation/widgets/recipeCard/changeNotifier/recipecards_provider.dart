import 'dart:convert';
import 'package:cocktelia/models/recipecards_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class RecipeCardProvider extends ChangeNotifier{
    List<RecipeCardModel> _allRecipes = [];
  //Obtener datos Json, parsearlos a Map y convertir a objetos para crear lista de RecipeCardModel:
  Future loadAllRecipes() async {
    String jsonString = await rootBundle.loadString('assets/data/jsonRecipeCards.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonList = jsonData['recipes'];
    _allRecipes = jsonList.map((json) => RecipeCardModel.fromJson(json)).toList();
    notifyListeners();
  }
  //Obtener recetas filtradas por categoría:
  List<RecipeCardModel> getRecipesByCategory(String category) {
    return _allRecipes.where((recipe) => recipe.category == category).toList();
  }
}
  final recipeCardProvider = RecipeCardProvider();