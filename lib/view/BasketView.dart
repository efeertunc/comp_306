import 'package:comp_306/cubit/BasketViewModel.dart';
import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants.dart';
import '../model/Food.dart';

class BasketView extends StatefulWidget {
  @override
  State<BasketView> createState() => _BasketView();
}

class _BasketView extends State<BasketView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Basket", style: TextStyle(color: Colors.black),),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: Constants.basketChangeNotifier,
        builder: (context, value, child) {

          List<Food> mergedList = []..addAll(Constants.launchList)..addAll(Constants.dessertList);
          Map<Food, int> mergedCountMap = {}..addAll(Constants.foodCountMapLaunch)..addAll(Constants.foodCountMapDessert);

          double totalPrice = mergedList.fold(0, (previousValue, food) => previousValue + (mergedCountMap[food]! * food.unitPrice!));

          return ListView.builder(
            itemCount: mergedList.length,
            itemBuilder: (context, index) {
              var food = mergedList[index];
              var foodCount = mergedCountMap[food];
              return ListTile(
                leading: Image.network(food.foodUrl!),
                title: Text(food.name!),
                subtitle: Text("Unit Price: ${food.unitPrice}"),
                trailing: Text("Count: $foodCount\nTotal Price: ${foodCount! * food.unitPrice!}"),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Map<Food, int> mergedCountMap = {}..addAll(Constants.foodCountMapLaunch)..addAll(Constants.foodCountMapDessert);
          for(Food food in []..addAll(Constants.launchList)..addAll(Constants.dessertList)){
            context.read<BasketViewModel>().postOrder(mergedCountMap[food]! * food.unitPrice!, 2, food.foodId, mergedCountMap[food]!);
          }
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Order'),
                  content: Text('Order is preparing.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          setState(() {
            Constants.foodCountMapLaunch.clear();
            Constants.foodCountMapDessert.clear();
            Constants.launchList.clear();
            Constants.dessertList.clear();
          });


        },
        label: ValueListenableBuilder<int>(
          valueListenable: Constants.basketChangeNotifier,
          builder: (context, value, child) {

            List<Food> mergedList = []..addAll(Constants.launchList)..addAll(Constants.dessertList);
            Map<Food, int> mergedCountMap = {}..addAll(Constants.foodCountMapLaunch)..addAll(Constants.foodCountMapDessert);

            double totalPrice = mergedList.fold(0, (previousValue, food) => previousValue + (mergedCountMap[food]! * food.unitPrice!));

            return Text('Order \$${totalPrice.toStringAsFixed(2)}');
          },
        ),
      ),
    );
  }
}
