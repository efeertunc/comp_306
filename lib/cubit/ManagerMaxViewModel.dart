import 'package:comp_306/model/Order.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ManagerMaxViewModel extends Cubit<ManagerMaxData> {
  ManagerMaxViewModel() : super(ManagerMaxData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> getManagerMaxNumberOfFood() async {
    var orderData = await repo.getManagerMaxNumberOfFood();
    emit(orderData);
  }
}
