import 'package:comp_306/cubit/ManagerMaxViewModel.dart';
import 'package:comp_306/cubit/StatusFalseViewModel.dart';
import 'package:comp_306/cubit/StatusTrueViewModel.dart';
import 'package:comp_306/cubit/StatusViewModel.dart';
import 'package:comp_306/cubit/managerViewModel.dart';
import 'package:comp_306/model/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/signupviewModel.dart';
import '../repo/FoodRepository.dart';

class ManagerView extends StatefulWidget {
  const ManagerView({Key? key}) : super(key: key);

  @override
  State<ManagerView> createState() => _ManagerViewState();
}

class _ManagerViewState extends State<ManagerView> {
  @override
  void initState() {
    super.initState();
    context.read<managerViewModel>().getAllOrders();
  }

  var foodName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<managerViewModel, OrderData>(builder: (contextBL, OrderData) {
          if(OrderData.connectionState == ConnectionState.done){
            if(OrderData.foodListDesserts.isNotEmpty && OrderData.foodListLaunches.isNotEmpty && OrderData.orderList.isNotEmpty){
              return SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                        child: ListView.builder(
                            itemCount: OrderData.orderList.length,
                            itemBuilder: (context, index) {
                              final order = OrderData.orderList[index];
                              print(OrderData.orderList.length);
                              print(OrderData.foodListDesserts.length);
                              print(OrderData.foodListLaunches.length);
                              for (int i = 0; i < OrderData.foodListDesserts.length; i++) {
                                if (order.foodId == OrderData.foodListDesserts[i].foodId) {
                                  foodName = OrderData.foodListDesserts[i].name;
                                }
                              }
                              for (int i = 0; i < OrderData.foodListLaunches.length; i++) {
                                if (order.foodId == OrderData.foodListLaunches[i].foodId) {
                                  foodName = OrderData.foodListLaunches[i].name;
                                }
                              }
                              return ListTile(
                                title: Text(foodName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Total Price: ${order.totalPrice!.toStringAsFixed(2)}'),
                                    Text('Number of Foods: ${order.numberOfFood}'),
                                    Text('Date: ${order.date}'),
                                    Text(
                                        'Approval Status: ${order.approvalStatus == "true" ? 'Approved' : 'Not Approved'}'),
                                  ],
                                ),
                                trailing: Checkbox(
                                  value: order.approvalStatus == "true",
                                  onChanged: (newValue) async {
                                    final updatedStatus = newValue ?? false ? "true" : "false";
                                    setState(() {
                                      order.approvalStatus = updatedStatus;
                                    });
                                    if (newValue!) {
                                      print(newValue);
                                      context
                                          .read<StatusStrueViewModel>()
                                          .postStatusTrue(order.orderId);
                                    } else {
                                      print(newValue);
                                      context
                                          .read<StatusFalseViewModel>()
                                          .postStatusFalse(order.orderId);
                                    }
                                  },
                                ),
                              );
                            }),
                      ),
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
                                        title: Text("True - False"),
                                        onTap: () {
                                          contextBL.read<StatusViewModel>().getManagerTrueFalse();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Status Data"),
                                                content: BlocBuilder<StatusViewModel, StatusData>(
                                                  builder: (contextBLS, statusData) {
                                                    if(statusData.connectionState == ConnectionState.done){
                                                      if(statusData.statusList.isNotEmpty){
                                                        return Container(
                                                          width: double.maxFinite,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: statusData.statusList.length,
                                                            itemBuilder: (context, index) {
                                                              return ListTile(
                                                                title: Text( "Approval Status: ${statusData.statusList[index].approvalStatus} -> Count: ${statusData.statusList[index].numApprovedOrders}" ), // Replace with actual data field
                                                              );
                                                            },
                                                          ),
                                                        );                                                      }
                                                    }
                                                    return Container();
                                                  },
                                                ),
                                              );
                                            },
                                          ); // Close the dialog
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Manager Max Counts"),
                                        onTap: () {
                                          // Handle decreasing price filter
                                          contextBL.read<ManagerMaxViewModel>().getManagerMaxNumberOfFood();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Status Data"),
                                                content: BlocBuilder<ManagerMaxViewModel, ManagerMaxData>(
                                                  builder: (contextBLS, statusData) {
                                                    if(statusData.connectionState == ConnectionState.done){
                                                      if(statusData.managerMaxList.isNotEmpty){
                                                        return Container(
                                                          width: double.maxFinite,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: statusData.managerMaxList.length,
                                                            itemBuilder: (context, index) {
                                                              return ListTile(
                                                                title: Text( "Order Id: ${statusData.managerMaxList[index].orderId} -> Food Id: ${statusData.managerMaxList[index].foodId} -> Number Of Food: ${statusData.managerMaxList[index].numberOfFood}" ), // Replace with actual data field
                                                              );
                                                            },
                                                          ),
                                                        );                                                      }
                                                    }
                                                    return Container();
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                          // Close the dialog
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
                      ),
                   ],
                  ));
            }
          }
      return Container();
    }));
  }
}
