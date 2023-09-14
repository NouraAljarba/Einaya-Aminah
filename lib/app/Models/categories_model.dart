class Category {
  final int categoryId;
  final String categoryName;

  Category({required this.categoryId, required this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categories_id'],
      categoryName: json['categories_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'categories_id': categoryId,
        'categories_name': categoryName,
      };
}
