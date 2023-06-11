import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewModel extends Cubit<FoodData> {
  MainViewModel()
      : super(FoodData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> getAllLaunches() async {
    var foodData = await repo.getAllLaunches();
    emit(foodData);
  }
}