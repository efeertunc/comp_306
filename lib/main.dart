import 'package:comp_306/cubit/BasketViewModel.dart';
import 'package:comp_306/cubit/DessertViewModel.dart';
import 'package:comp_306/cubit/MainViewModel.dart';
import 'package:comp_306/cubit/ManagerMaxViewModel.dart';
import 'package:comp_306/cubit/ProfileViewModel.dart';
import 'package:comp_306/cubit/StatusFalseViewModel.dart';
import 'package:comp_306/cubit/StatusTrueViewModel.dart';
import 'package:comp_306/cubit/StatusViewModel.dart';
import 'package:comp_306/cubit/loginViewModel.dart';
import 'package:comp_306/cubit/managerViewModel.dart';
import 'package:comp_306/cubit/signupviewModel.dart';
import 'package:comp_306/view/BottomNavBarView.dart';
import 'package:comp_306/view/MainView.dart';
import 'package:comp_306/view/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainViewModel()),
        BlocProvider(create: (context) => loginViewModel()),
        BlocProvider(create: (context) => signupViewModel()),
        BlocProvider(create: (context) => managerViewModel()),
        BlocProvider(create: (context) => DessertViewModel()),
        BlocProvider(create: (context) => BasketViewModel()),
        BlocProvider(create: (context) => ProfileViewModel()),
        BlocProvider(create: (context) => StatusStrueViewModel()),
        BlocProvider(create: (context) => StatusFalseViewModel()),
        BlocProvider(create: (context) => StatusViewModel()),
        BlocProvider(create: (context) => ManagerMaxViewModel()),
      ],
      child: const MyApp(),
    ),
  );
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
        BlocProvider(create: (context) => loginViewModel()),
        BlocProvider(create: (context) => signupViewModel()),
        BlocProvider(create: (context) => StatusStrueViewModel()),
        BlocProvider(create: (context) => StatusFalseViewModel()),
        BlocProvider(create: (context) => StatusViewModel()),
        BlocProvider(create: (context) => ManagerMaxViewModel()),
      ],
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}
