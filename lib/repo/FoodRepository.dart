import 'package:comp_306/model/ManagerMax.dart';
import 'package:comp_306/model/Order.dart';
import 'package:comp_306/model/User.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/Food.dart';
import '../model/Status.dart';

class FoodRepository {

  Future<FoodData> getAllLaunches() async {
    var url = "http://172.20.97.208:3000/getAllLaunches";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllLaunchesAZ() async {
    var url = "http://172.20.97.208:3000/getAllLaunchesAZ";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllLaunchesZA() async {
    var url = "http://172.20.97.208:3000/getAllLaunchesZA";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllLaunchesAscPrice() async {
    var url = "http://172.20.97.208:3000/getAllLaunchesAscPrice";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllLaunchesDescPrice() async {
    var url = "http://172.20.97.208:3000/getAllLaunchesDescPrice";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllDesserts() async {
    var url = "http://172.20.97.208:3000/getAllDesserts";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllDessertsAZ() async {
    var url = "http://172.20.97.208:3000/getAllDessertsAZ";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllDessertsZA() async {
    var url = "http://172.20.97.208:3000/getAllDessertsZA";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllDessertsDescPrice() async {
    var url = "http://172.20.97.208:3000/getAllDessertsDescPrice";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> getAllDessertsAscPrice() async {
    var url = "http://172.20.97.208:3000/getAllDessertsAscPrice";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var foodList = data.map((json) => Food.fromJson(json)).toList();

    return FoodData(ConnectionState.done, foodList);
  }

  Future<FoodData> updateProfile(user_id, name, password, address) async {
    var url = "http://172.20.97.208:3000/updateProfile";

    await Dio().post(
      url,
      data: {
        'user_id': user_id,
        'name': name,
        'password': password,
        'address': address,
      },
    );

    return FoodData(ConnectionState.done, []);
  }

  Future<FoodData> postOrder (total_price,user_id, food_id, number_of_food) async {
    var url = "http://172.20.97.208:3000/postOrder";

    await Dio().post(
      url,
      data: {
        'total_price': total_price,
        'user_id': user_id,
        'food_id': food_id,
        'number_of_food': number_of_food,
      },
    );

    return FoodData(ConnectionState.done, []);
  }

  Future<UserData> login() async {
    var url = "http://172.20.97.208:3000/getAllUsers";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var userList = data.map((json) => User.fromJson(json)).toList();

    return UserData(ConnectionState.done, userList);
  }

  Future<UserData> signup(name, password, address) async {
    var url = "http://172.20.97.208:3000/signup";

    var response = await Dio().post(
      url,
      data: {
        'name': name,
        'password': password,
        'address': address,
      },
    );

    return UserData(ConnectionState.done, []);
  }

  Future<OrderData> postStatusTrue(orderId) async {
    var url = "http://172.20.97.208:3000/postStatusTrue";
    print(orderId);

    var response = await Dio().post(
      url,
      data: {
        'order_id': orderId,
      },
    );

    return OrderData(ConnectionState.done, [], [], []);
  }

  Future<OrderData> postStatusFalse(orderId) async {
    var url = "http://172.20.97.208:3000/postStatusFalse";
    print(orderId);

    var response = await Dio().post(
      url,
      data: {
        'order_id': orderId,
      },
    );

    return OrderData(ConnectionState.done, [], [], []);
  }

  Future<OrderData> getAllOrders() async {
    var url = "http://172.20.97.208:3000/getAllOrders";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var orderList = data.map((json) => Order.fromJson(json)).toList();

    var url1 = "http://172.20.97.208:3000/getAllLaunches";

    var response1 = await Dio().get(url1);
    var data1 = response1.data as List<dynamic>;
    var foodList = data1.map((json) => Food.fromJson(json)).toList();

    var url2 = "http://172.20.97.208:3000/getAllDesserts";

    var response2 = await Dio().get(url2);
    var data2 = response2.data as List<dynamic>;
    var dessertList = data2.map((json) => Food.fromJson(json)).toList();

    return OrderData(ConnectionState.done, orderList, foodList, dessertList);
  }

  Future<StatusData> getManagerTrueFalse() async {
    var url = "http://172.20.97.208:3000/getManagerTrueFalse";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var orderList = data.map((json) => Status.fromJson(json)).toList();

    return StatusData(ConnectionState.done, orderList);
  }

  Future<ManagerMaxData> getManagerMaxNumberOfFood() async {
    var url = "http://172.20.97.208:3000/getManagerMaxNumberOfFood";

    var response = await Dio().get(url);
    var data = response.data as List<dynamic>;
    var orderList = data.map((json) => ManagerMax.fromJson(json)).toList();

    return ManagerMaxData(ConnectionState.done, orderList);
  }
}

class FoodData {
  final ConnectionState connectionState;
  final List<Food> foodList;

  FoodData(
    this.connectionState,
    this.foodList,
  );
}

class UserData {
  final ConnectionState connectionState;
  final List<User> userList;

  UserData(
      this.connectionState,
      this.userList,
      );
}

class StatusData {
  final ConnectionState connectionState;
  final List<Status> statusList;

  StatusData(
      this.connectionState,
      this.statusList,
      );
}

class ManagerMaxData {
  final ConnectionState connectionState;
  final List<ManagerMax> managerMaxList;

  ManagerMaxData(
      this.connectionState,
      this.managerMaxList,
      );
}

class OrderData {
  final ConnectionState connectionState;
  final List<Order> orderList;
  final List<Food> foodListLaunches;
  final List<Food> foodListDesserts;

  OrderData(
      this.connectionState,
      this.orderList,
      this.foodListLaunches,
      this.foodListDesserts,
      );
}