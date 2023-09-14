class Preference {
  
  final int categoryId;
  final String userId;
  final bool isIncluded;

  Preference({
   
    required this.categoryId,
    required this.userId,
    required this.isIncluded,
  });

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
     
      categoryId: json['categories_id'],
      userId: json['user_id'],
      isIncluded: json['is_included'],
    );
  }

  Map<String, dynamic> toJson() => {
  
        'categories_id': categoryId,
        'user_id': userId,
        'is_included': isIncluded,
      };
}
