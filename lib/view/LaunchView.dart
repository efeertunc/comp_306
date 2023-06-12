import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants.dart';

class LaunchView extends StatefulWidget {
  LaunchView({required Key key}) : super(key: key);

  @override
  State<LaunchView> createState() => _LaunchView();
}

class _LaunchView extends State<LaunchView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<MainViewModel>().getAllLaunches();
    updateKeepAlive();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainViewModel, FoodData>(builder: (contextBL, foodData) {
        if (foodData.connectionState == ConnectionState.done) {
          if (foodData.foodList.isNotEmpty) {
            return Stack(
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 2 / 2.42),
                    itemCount: foodData.foodList.length,
                    itemBuilder: (context, index) {
                      if (Constants
                              .foodCountMapLaunch[foodData.foodList[index]] ==
                          null) {
                        Constants.foodCountMapLaunch[foodData.foodList[index]] =
                            0;
                      }
                      print(Constants.foodCountMapLaunch[foodData.foodList[0]]);
                      return Padding(
                        padding: EdgeInsets.all(12),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                child: Image.network(
                                  "${foodData.foodList[index].foodUrl}",
                                  cacheWidth: null,
                                  cacheHeight: null,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text('Could not load image');
                                  },
                                ),
                              ),
                              Text("${foodData.foodList[index].name}"),
                              Text(
                                  "Unit Price: ${foodData.foodList[index].unitPrice}"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (Constants.foodCountMapLaunch[
                                                  foodData.foodList[index]] ==
                                              null) {
                                            Constants.foodCountMapLaunch[
                                                foodData.foodList[index]] = 0;
                                          }

                                          if (Constants.foodCountMapLaunch[
                                                  foodData.foodList[index]]! >
                                              0) {
                                            Constants.foodCountMapLaunch[
                                                    foodData.foodList[index]] =
                                                Constants.foodCountMapLaunch[
                                                        foodData
                                                            .foodList[index]]! -
                                                    1;
                                          }
                                          Constants.dessertList
                                              .clear(); // Clear the list before populating it
                                          Constants.launchList.clear();
                                          // Clear the list before populating it
                                          Constants.foodCountMapDessert
                                              .forEach((food, count) {
                                            if (count > 0) {
                                              Constants.dessertList.add(food);
                                            }
                                          });
                                          Constants.foodCountMapLaunch
                                              .forEach((food, count) {
                                            if (count > 0) {
                                              Constants.launchList.add(food);
                                            }
                                          });
                                          Constants
                                              .basketChangeNotifier.value++;
                                        });
                                      },
                                      icon: Icon(Icons.remove)),
                                  Text(
                                      "${Constants.foodCountMapLaunch[foodData.foodList[index]]}"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          print("zzz");
                                          if (Constants.foodCountMapLaunch[
                                                  foodData.foodList[index]] ==
                                              null) {
                                            Constants.foodCountMapLaunch[
                                                foodData.foodList[index]] = 0;
                                          }

                                          print(Constants.foodCountMapLaunch[
                                              foodData.foodList[index]]);
                                          Constants.foodCountMapLaunch[foodData
                                              .foodList[index]] = Constants
                                                      .foodCountMapLaunch[
                                                  foodData.foodList[index]]! +
                                              1;
                                        });
                                        Constants.dessertList
                                            .clear(); // Clear the list before populating it
                                        Constants.launchList.clear();
                                        // Clear the list before populating it
                                        Constants.foodCountMapDessert
                                            .forEach((food, count) {
                                          if (count > 0) {
                                            Constants.dessertList.add(food);
                                          }
                                        });
                                        Constants.foodCountMapLaunch
                                            .forEach((food, count) {
                                          if (count > 0) {
                                            Constants.launchList.add(food);
                                          }
                                        });
                                        Constants.basketChangeNotifier.value++;
                                      },
                                      icon: Icon(Icons.add)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Filter Options"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text("A-Z"),
                                  onTap: () {
                                    contextBL
                                        .read<MainViewModel>()
                                        .getAllLaunchesAZ();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Z-A"),
                                  onTap: () {
                                    // Handle Z-A filter
                                    contextBL
                                        .read<MainViewModel>()
                                        .getAllLaunchesZA();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Increasing price"),
                                  onTap: () {
                                    // Handle increasing price filter
                                    contextBL
                                        .read<MainViewModel>()
                                        .getAllLaunchesAscPrice();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Decreasing price"),
                                  onTap: () {
                                    // Handle decreasing price filter
                                    contextBL
                                        .read<MainViewModel>()
                                        .getAllLaunchesDescPrice();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(Icons.filter_list),
                  ),
                )
              ],
            );
          }
        }
        return Container(
          child: Text(
            "No data available",
            style: TextStyle(color: Colors.black),
          ),
        );
      }),
    );
  }
}
