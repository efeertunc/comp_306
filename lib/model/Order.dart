class Order {
  int? orderId;
  String? approvalStatus;
  double? totalPrice;
  int? userId;
  int? foodId;
  int? numberOfFood;
  int? managerId;
  String? date;

  Order(
      {this.orderId,
      this.approvalStatus,
      this.totalPrice,
      this.userId,
      this.foodId,
      this.numberOfFood,
      this.managerId,
      this.date});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    approvalStatus = json['approval_status'];
    totalPrice = json['total_price'];
    userId = json['user_id'];
    foodId = json['food_id'];
    numberOfFood = json['number_of_food'];
    managerId = json['manager_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['approval_status'] = this.approvalStatus;
    data['total_price'] = this.totalPrice;
    data['user_id'] = this.userId;
    data['food_id'] = this.foodId;
    data['number_of_food'] = this.numberOfFood;
    data['manager_id'] = this.managerId;
    data['date'] = this.date;
    return data;
  }
}
