import 'package:comp_306/Constants.dart';
import 'package:comp_306/cubit/loginViewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:comp_306/view/BottomNavBarView.dart';
import 'package:comp_306/view/ManagerView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SignUpScreen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<loginViewModel>().login();
  }

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<loginViewModel, UserData>(
        builder: (context, userData) {
          if (userData.connectionState == ConnectionState.done) {
            if (userData.userList.isNotEmpty) {
              Constants.userListAll = userData.userList;
              return SafeArea(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                      child: Column(
                        children: [
                          Text("name"),
                          TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                letterSpacing: 3,
                                color: Colors.grey,
                                fontSize: 28),
                            controller: _name,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text("password"),
                          TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                letterSpacing: 3,
                                color: Colors.grey,
                                fontSize: 28),
                            controller: _password,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              for (int i = 0;
                                  i < userData.userList.length;
                                  i++) {
                                if (userData.userList[i].name == _name.text &&
                                    userData.userList[i].password ==
                                        _password.text) {
                                  isLoggedIn = true;
                                  Constants.user_id = userData.userList[i].userId;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BottomNavBarView()),
                                  );
                                }
                                else if (_name.text == "admin" && _password.text == "admin"){
                                  //Constants.user_id = userData.userList[i].userId;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ManagerView()),
                                  );
                                }
                              }
                              if (isLoggedIn) {

                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content:
                                          Text('Invalid username or password'),
                                      actions: [
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              color: Colors.blue,
                              child: const Center(
                                child: Text("Log in"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              color: Colors.blue,
                              child: const Center(
                                child: Text("Sign Up"),
                              ),
                            ),
                          ),
                        ],
                      )));
            }
          }
          return Container();
        },
      ),
    );
  }
}
