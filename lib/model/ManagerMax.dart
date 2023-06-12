class ManagerMax {
  int? orderId;
  int? foodId;
  int? numberOfFood;

  ManagerMax({this.orderId, this.foodId, this.numberOfFood});

  ManagerMax.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    foodId = json['food_id'];
    numberOfFood = json['number_of_food'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['food_id'] = this.foodId;
    data['number_of_food'] = this.numberOfFood;
    return data;
  }
}