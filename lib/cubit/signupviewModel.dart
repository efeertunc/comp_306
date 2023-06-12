import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class signupViewModel extends Cubit<UserData> {
  signupViewModel() : super(UserData(ConnectionState.waiting, []));

  var repo = FoodRepository();

  Future<void> signup(name, password, address) async {
    var userData = await repo.signup(name, password, address);
    emit(userData);
  }
}
