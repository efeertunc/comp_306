import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DessertViewModel extends Cubit<FoodData> {
  DessertViewModel()
      : super(FoodData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> getAllDesserts() async {
    var foodData = await repo.getAllDesserts();
    emit(foodData);
  }

  Future<void> getAllDessertsAZ() async {
    var foodData = await repo.getAllDessertsAZ();
    emit(foodData);
  }

  Future<void> getAllDessertsZA() async {
    var foodData = await repo.getAllDessertsZA();
    emit(foodData);
  }

  Future<void> getAllDessertsAscPrice() async {
    var foodData = await repo.getAllDessertsAscPrice();
    emit(foodData);
  }

  Future<void> getAllDessertsDescPrice() async {
    var foodData = await repo.getAllDessertsDescPrice();
    emit(foodData);
  }

}