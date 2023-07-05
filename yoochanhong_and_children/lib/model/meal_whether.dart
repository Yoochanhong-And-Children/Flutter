class MealWhether {
  String? mealType;

  MealWhether({this.mealType});

  MealWhether.fromJson(Map<String, dynamic> json) {
    mealType = json['meal_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['meal_type'] = mealType;
    return data;
  }
}