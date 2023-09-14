class Ingredient {
  final int? id;
  final String ingredientName;
  final String? description;
  final int categoryId;

  Ingredient({
    this.id,
    required this.ingredientName,
    this.description,
    required this.categoryId,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      ingredientName: json['ingredient_name'],
      description: json['description'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ingredient_name': ingredientName,
        'category_id': categoryId,
      };
}
