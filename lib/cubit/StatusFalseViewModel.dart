import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StatusFalseViewModel extends Cubit<OrderData> {
  StatusFalseViewModel()
      : super(OrderData(ConnectionState.waiting, [], [], []));

  var repo = FoodRepository();

  Future<void> postStatusFalse(orderId) async {
    var orderData = await repo.postStatusFalse(orderId);
    emit(orderData as OrderData);
  }
}
