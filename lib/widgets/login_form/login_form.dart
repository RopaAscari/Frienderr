import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/keyboard_builder/keyboard_builder.dart';
import 'package:frienderr/screens/register/registerUser/registerUser.dart';

import 'package:frienderr/screens/register/registerUsername/registerUsername.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  String? errors = '';
  bool isLoading = false;
  bool canPasswordShow = true;
  bool isUsernameEmpty = true;
  bool isPasswordEmpty = true;

  final AuthenticationBloc authenticationBloc = new AuthenticationBloc();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        isUsernameEmpty = !(emailController.text != '');
      });
    });

    passwordController.addListener(() {
      setState(() {
        isPasswordEmpty = !(passwordController.text != '');
      });
    });
  }

  navigateToRegisterScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: RegisterUser(),
            type: transition.PageTransitionType.slideInLeft));
  }

  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state is AuthenticationFailure) {
            _onWidgetDidBuild(() {
              return FlashMessage.buildErrorSnackbar(context, state.error);
            });
          }
          return Column(children: [
            Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: emailTextField(state)),
            Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: passwordTextField(state)),
            KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                return Container(
                    margin: EdgeInsets.only(top: 25
                        //isKeyboardVisible ? 25.0 : 240
                        ),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text.rich(TextSpan(
                              text: "Don't have an account. Register",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                    text: ' here',
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap =
                                          () => navigateToRegisterScreen(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.orangeAccent))
                              ]))),
                      loginButton()
                    ]));
              },
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 70),
                child: loadingLogin(state))
          ]);
        });
  }

  Widget emailTextField(AuthenticationState state) {
    return TextField(
        obscureText: false,
        controller: emailController,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: new OutlineInputBorder(
              // borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: state is AuthenticationFailure ? '' : null,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            // fillColor: HexColor('#C4C4C4').withOpacity(0.5),
            filled: true,
            labelText: 'Email',
            contentPadding: const EdgeInsets.only(top: 40.0)));
  }

  Widget passwordTextField(AuthenticationState state) {
    return TextField(
        obscureText: canPasswordShow,
        controller: passwordController,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 21.5,
            ),
            suffixIcon: !canPasswordShow
                ? IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility_off,
                      size: 21.5,
                    ))
                : IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility,
                      size: 21.5,
                    )),
            //  fillColor: HexColor('#C4C4C4').withOpacity(0.5),
            filled: true,
            errorText: state is AuthenticationFailure ? '' : null,
            labelText: 'Password'));
  }

  Widget loginButton() {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.transparent))),
          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#FFFFFF')
              .withOpacity(isUsernameEmpty && isPasswordEmpty ? 0.7 : 1)),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 55))),
      child:
          Text('Continue', style: TextStyle(color: Colors.black, fontSize: 16)),
      onPressed: isUsernameEmpty && isPasswordEmpty
          ? null
          : () {
              _onLoginButtonPressed(context);
            },
    );
  }

  Widget loadingLogin(AuthenticationState state) {
    return state is LoginLoading
        ? new CupertinoActivityIndicator()
        : Container();
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    authenticationBloc.add(LoginButtonPressed(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    ));
  }
}
