import 'package:comp_306/Constants.dart';
import 'package:comp_306/cubit/signupviewModel.dart';
import 'package:comp_306/repo/FoodRepository.dart';
import 'package:comp_306/view/BottomNavBarView.dart';
import 'package:comp_306/view/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool isSignedup = false;

  @override
  Widget build(BuildContext contexta) {
    return Scaffold(
        body: BlocBuilder<signupViewModel, UserData>(builder: (context, state) {
      if (state.connectionState == ConnectionState.done) {
          Constants.user_id = Constants.userListAll!.last.userId! + 1;
      }
      return SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
        child: SafeArea(
          child: Column(
            children: [
              Text("name"),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    letterSpacing: 3, color: Colors.grey, fontSize: 22),
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
                    letterSpacing: 3, color: Colors.grey, fontSize: 22),
                controller: _password,
              ),
              const SizedBox(
                height: 40,
              ),
              Text("address"),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    letterSpacing: 3, color: Colors.grey, fontSize: 22),
                controller: _address,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_name.text == "" ||
                      _password.text == "" ||
                      _address.text == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'please enter a valid username, password or address.'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    context
                        .read<signupViewModel>()
                        .signup(_name.text, _password.text, _address.text);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Sign Up'),
                            content: Text('User is added successfully.'),
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

                  }
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 90,
                  color: Colors.blue,
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }));
  }
}
