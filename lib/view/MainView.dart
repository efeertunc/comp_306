import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:comp_306/view/DessertView.dart';
import 'package:comp_306/view/LaunchView.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 50,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Main Page"),
                ]),
            //centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.cyanAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 0.5,
              tabs: [
                Tab(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Launch",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Dessert",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LaunchView(key: PageStorageKey<String>('LaunchView')),
              DessertView(key: PageStorageKey<String>('DessertView'))
            ],
          ),
        ));
  }
}
