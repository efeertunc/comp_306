import 'package:comp_306/cubit/DessertViewModel.dart';
import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants.dart';

class DessertView extends StatefulWidget {
  DessertView({required Key key}) : super(key: key);

  @override
  State<DessertView> createState() => _DessertView();
}

class _DessertView extends State<DessertView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<DessertViewModel>().getAllDesserts();
    updateKeepAlive();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<DessertViewModel, FoodData>(builder: (contextBL, foodData) {
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
                              .foodCountMapDessert[foodData.foodList[index]] ==
                          null) {
                        Constants
                            .foodCountMapDessert[foodData.foodList[index]] = 0;
                      }
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
                                  fit: BoxFit.fill,
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
                                          if (Constants.foodCountMapDessert[
                                                  foodData.foodList[index]] ==
                                              null) {
                                            Constants.foodCountMapDessert[
                                                foodData.foodList[index]] = 0;
                                          }

                                          if (Constants.foodCountMapDessert[
                                                  foodData.foodList[index]]! >
                                              0) {
                                            Constants.foodCountMapDessert[
                                                    foodData.foodList[index]!] =
                                                Constants.foodCountMapDessert[
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
                                      "${Constants.foodCountMapDessert[foodData.foodList[index]]}"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (Constants.foodCountMapDessert[
                                                  foodData.foodList[index]] ==
                                              null) {
                                            Constants.foodCountMapDessert[
                                                foodData.foodList[index]] = 0;
                                          }

                                          Constants.foodCountMapDessert[foodData
                                              .foodList[index]!] = Constants
                                                      .foodCountMapDessert[
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
                              )
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
                                        .read<DessertViewModel>()
                                        .getAllDessertsAZ();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Z-A"),
                                  onTap: () {
                                    // Handle Z-A filter
                                    contextBL
                                        .read<DessertViewModel>()
                                        .getAllDessertsZA();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Increasing price"),
                                  onTap: () {
                                    // Handle increasing price filter
                                    contextBL
                                        .read<DessertViewModel>()
                                        .getAllDessertsAscPrice();
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                ListTile(
                                  title: Text("Decreasing price"),
                                  onTap: () {
                                    // Handle decreasing price filter
                                    contextBL
                                        .read<DessertViewModel>()
                                        .getAllDessertsDescPrice();
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
        return Container();
      }),
    );
  }
}
