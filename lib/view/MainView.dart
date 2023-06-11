import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {


  @override
  void initState() {
    super.initState();
    context.read<MainViewModel>().getAllLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title : Row(
          children: [
          ],
        ),
      ),
      body: BlocBuilder<MainViewModel, FoodData>(
          builder: (context, foodData) {
            if (foodData.connectionState == ConnectionState.done) {
              if (foodData.foodList.isNotEmpty) {
                print("qqqqq");
                print(foodData.foodList[0]);

                return Text(foodData.foodList.toString());
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          }),
    );
  }

}