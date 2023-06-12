import 'package:comp_306/model/Order.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class managerViewModel extends Cubit<OrderData> {
  managerViewModel() : super(OrderData(ConnectionState.waiting, [], [], []));

  var repo = FoodRepository();

  Future<void> getAllOrders() async {
    var orderData = await repo.getAllOrders();
    emit(orderData);
  }

}
