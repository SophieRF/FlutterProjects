import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/changeNotifier/categorycards_provider.dart';
import 'package:cocktelia/presentation/widgets/recipeCards/changeNotifier/recipecards_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension BuildContextExtension on BuildContext{
  CategoryCardProvider get categoryCardProvider => Provider.of<CategoryCardProvider>(this);
  RecipeCardProvider get recipeCardProvider => Provider.of<RecipeCardProvider>(this);
  RecipeScreenProvider get recipeScreenProvider => Provider.of<RecipeScreenProvider>(this);
}