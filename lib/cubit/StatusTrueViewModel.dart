import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StatusStrueViewModel extends Cubit<OrderData> {
  StatusStrueViewModel()
      : super(OrderData(ConnectionState.waiting, [], [], []));

  var repo = FoodRepository();

  Future<void> postStatusTrue(orderId) async {
    var orderData = await repo.postStatusTrue(orderId);
    emit(orderData as OrderData);
  }
}
