import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class loginViewModel extends Cubit<UserData> {
  loginViewModel() : super(UserData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> login() async {
    var userData = await repo.login();
    emit(userData);
  }
}
