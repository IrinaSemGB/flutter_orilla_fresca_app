class CategoryPart {
  String name;
  String imageName;
  bool isSelected;

  CategoryPart({
    required this.name,
    required this.imageName,
    required this.isSelected,
  });

  factory CategoryPart.fromJson(Map<String, dynamic> json) {
    return CategoryPart(
      name: json['name'],
      imageName: json['imageName'],
      isSelected: false,
    ); 
  }

  static List<CategoryPart> fromJsonArray(List<dynamic> jsonParts) {
    List<CategoryPart> parts = [];

    jsonParts.forEach((jsonData) {
      parts.add(CategoryPart.fromJson(jsonData));
    });

    return parts;
  }
}