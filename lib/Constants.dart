import 'package:comp_306/model/Food.dart';
import 'package:comp_306/model/User.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  static Map<Food, int> foodCountMapLaunch = {};
  static List<Food> launchList = [];
  static Map<Food, int> foodCountMapDessert = {};
  static List<Food> dessertList = [];
  static ValueNotifier<int> basketChangeNotifier = ValueNotifier<int>(0);
  static int? user_id = 0;
  static List<User>? userListAll;

}