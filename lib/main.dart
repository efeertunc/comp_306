import 'package:comp_306/cubit/BasketViewModel.dart';
import 'package:comp_306/cubit/DessertViewModel.dart';
import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/cubit/ProfileViewModel.dart';
import 'package:comp_306/view/BottomNavBarView.dart';
import 'package:comp_306/view/MainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainViewModel()),
        BlocProvider(create: (context) => DessertViewModel()),
        BlocProvider(create: (context) => BasketViewModel()),
        BlocProvider(create: (context) => ProfileViewModel()),
      ],
      child: Scaffold(
        body: BottomNavBarView(),
      ),
    );
  }
}
