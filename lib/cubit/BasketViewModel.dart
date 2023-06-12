import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketViewModel extends Cubit<FoodData> {
  BasketViewModel()
      : super(FoodData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> postOrder(total_price,user_id, food_id, number_of_food) async {
    var foodData = await repo.postOrder(total_price,user_id, food_id, number_of_food);
    emit(foodData);
  }


}