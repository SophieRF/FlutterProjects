class CategoryCardModel {
  int id;
  String categoryImage;
  String categoryName;
  CategoryCardModel({this.id= 0, this.categoryImage= '', this.categoryName= ''});

  factory CategoryCardModel.fromJson(Map<String, dynamic> json) {
    return CategoryCardModel(
      id: json['id'] as int,
      categoryImage: json['categoryImage'] as String,
      categoryName: json['categoryName'] as String,
    );
  }
}
