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
    required this.listStrIngredient, // list 20
    required this.listStrMeasure, // list 20
    required this.strSource,
  });
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  List<String> listStrIngredient;
  List<String> listStrMeasure;
  String strSource;

  factory FoodMenu.fromJson(Map<String, dynamic> json) => FoodMenu(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'],
        strTags: json['strTags'],
        strYoutube: json['strYoutube'],
        listStrIngredient: List.generate(20, (index) => json['listStrIngredient${index+1}']),
        listStrMeasure: List.generate(20, (index) => json['strMeasure${index+1}']),
        strSource: json['strSource'],
      );
}
