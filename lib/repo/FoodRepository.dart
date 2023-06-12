import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/Food.dart';

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
}

class FoodData {
  final ConnectionState connectionState;
  final List<Food> foodList;

  FoodData(
    this.connectionState,
    this.foodList,
  );
}
