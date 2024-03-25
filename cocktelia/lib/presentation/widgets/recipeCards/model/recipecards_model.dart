class RecipeCardModel{
  final int id;
  final String recipeImage;
  final String recipeName;
  final String category;
  RecipeCardModel({this.id= 0, this.recipeImage= '', this.recipeName= '', this.category = '',
});

  factory RecipeCardModel.fromJson(Map<String, dynamic> json) {
    return RecipeCardModel(
      id: json['id'] as int,
      recipeImage: json['image'] as String,
      recipeName: json['name'] as String,
      category: json['category'] as String,
    );
  }
}