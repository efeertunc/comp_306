import 'package:comp_306/model/Order.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StatusViewModel extends Cubit<StatusData> {
  StatusViewModel() : super(StatusData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> getManagerTrueFalse() async {
    var orderData = await repo.getManagerTrueFalse();
    emit(orderData);
  }
}
