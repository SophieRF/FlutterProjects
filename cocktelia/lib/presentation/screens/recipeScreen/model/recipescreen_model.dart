class RecipeScreenModel{
  String drinkName;
  String drinkImage;
  String drinkIngredients;
  String howToMake;
  RecipeScreenModel({this.drinkImage='', this.drinkName='', this.drinkIngredients='', this.howToMake=''});

factory RecipeScreenModel.fromJson(Map<String, dynamic> json) {
    return RecipeScreenModel(
      drinkName: json['drinkName'] as String,
      drinkImage: json['drinkImage'] as String,
      drinkIngredients: json['drinkIngredients'] as String,
      howToMake: json["howToMake"] as String,
    );
  }
}