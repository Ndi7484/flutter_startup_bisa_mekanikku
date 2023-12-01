class FoodMenu {
  FoodMenu({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.listStrIngredient,
    required this.listStrMeasure,
    required this.strSource,
  });

  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final List<String> listStrIngredient;
  final List<String> listStrMeasure;
  final String strSource;

  factory FoodMenu.fromJson(Map<String, dynamic> json) => FoodMenu(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'],
        strTags: json['strTags'] ?? '',
        strYoutube: json['strYoutube'],
        listStrIngredient: List.generate(
            20, (index) => json['strIngredient${index + 1}'] ?? ''),
        listStrMeasure: List.generate(
            20,
            (index) => (json['strMeasure${index + 1}'] != ' ')
                ? json['strMeasure${index + 1}'] ?? ''
                : ''),
        strSource: json['strSource'] ?? '',
      );
}
