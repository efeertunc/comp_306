class User {
  int? userId;
  String? name;
  String? password;

  User({this.userId, this.name, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
