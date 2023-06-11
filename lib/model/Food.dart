class Food {
  int? foodId;
  String? name;
  double? unitPrice;
  String? foodType;
  String? foodUrl;

  Food({this.foodId, this.name, this.unitPrice, this.foodType, this.foodUrl});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    name = json['name'];
    unitPrice = json['unit_price'];
    foodType = json['food_type'];
    foodUrl = json['food_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_id'] = this.foodId;
    data['name'] = this.name;
    data['unit_price'] = this.unitPrice;
    data['food_type'] = this.foodType;
    data['food_url'] = this.foodUrl;
    return data;
  }
}