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
}

class FoodData {
  final ConnectionState connectionState;
  final List<Food> foodList;

  FoodData(
    this.connectionState,
    this.foodList,
  );
}
