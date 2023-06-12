import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Cubit<FoodData> {
  ProfileViewModel()
      : super(FoodData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> updateProfile(user_id, name, password, address) async {
    var userData = await repo.updateProfile(user_id, name, password, address);
    emit(userData);
  }
}