import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/screens/initial/Initial.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:frienderr/widgets/login_form/login_form.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class Login extends StatefulWidget {
  late final UserRepository userRepository = new UserRepository();

  Login({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  navigateToInitialScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: Intiial(), type: transition.PageTransitionType.slideInLeft));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Column(children: [
                        IconButton(
                            onPressed: () => navigateToInitialScreen(),
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                      ])),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("Let's sign you in",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Welcome back',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ])),
                  Container(
                      padding: const EdgeInsets.all(30.0),
                      margin: const EdgeInsets.only(top: 40.0),
                      child: LoginForm()),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
