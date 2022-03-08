import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/keyboard_builder/keyboard_builder.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class RegisterUser extends StatefulWidget {
  final UserRepository userRepository = new UserRepository();

  RegisterUser({Key? key}) : super(key: key);

  @override
  @override
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State<RegisterUser> {
  bool isPasswordEmpty = true;
  bool canPasswordShow = true;
  AuthenticationBloc authenticateBloc = new AuthenticationBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        isPasswordEmpty = !(passwordController.text != '');
      });
    });
  }

  navigateToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterUser()));
    /* Navigator.push(
        context,
        transition.PageTransition(
            child: RegisterUser(),
            type: transition.PageTransitionType.slideInLeft));*/
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authenticateBloc,
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state is AuthenticationFailure) {
            _onWidgetDidBuild(() {
              return FlashMessage.buildErrorSnackbar(context, state.error);
            });
          }
          return Container(
              color: Theme.of(context).canvasColor,
              child: SafeArea(
                  child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topLeft,
                                child: Column(children: [
                                  IconButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      icon: Icon(Icons.arrow_back_ios_rounded)),
                                ])),
                            Container(
                                padding: const EdgeInsets.all(30.0),
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Column(children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text("Create your account",
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              alignment: Alignment.topLeft,
                                              child: Text("Let's sign you in",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  )),
                                            ),
                                          ])),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: emailTextFieldWidget(state)),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 30),
                                          child:
                                              passwordTextFieldWidget(state)),
                                      Container(child: signUpButton()),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 30),
                                          child: loadingWidget(state))
                                    ]))
                          ],
                        ),
                      ))));
        });
  }

  Widget loadingWidget(AuthenticationState state) {
    if (state is RegisterUserEventLoading) {
      return Center(child: CupertinoActivityIndicator(radius: 12.5));
    } else {
      return Center();
    }
  }

  Widget signUpButton() {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Container(
          margin: EdgeInsets.only(top: 20 //isKeyboardVisible ? 10.0 :
              //  .. 400
              ),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text.rich(TextSpan(
                    text: "Alreay have an account?. Login",
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.47),
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                          text: ' here',
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => navigateToLoginScreen(),
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.5),
                              color: Colors.orangeAccent))
                    ]))),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          side: BorderSide(color: Colors.transparent))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context)
                          .buttonColor
                          .withOpacity(isPasswordEmpty ? 0.7 : 1)),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 55))),
              child: Text('Create Account',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                  )),
              onPressed: isPasswordEmpty
                  ? null
                  : () {
                      _onRegisterButtonPressed(context);
                    },
            ),
          ]));
    });
  }

  Widget passwordTextFieldWidget(AuthenticationState state) {
    return TextField(
        maxLength: 20,
        obscureText: canPasswordShow,
        controller: passwordController,
        decoration: new InputDecoration(
            counterStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
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
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: !canPasswordShow
                ? IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(Icons.visibility_off))
                : IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(Icons.visibility)),
            filled: true,
            errorStyle: TextStyle(height: 0),
            errorText: state is AuthenticationFailure ? '' : null,
            labelText: 'Password'));
  }

  Widget emailTextFieldWidget(AuthenticationState state) {
    return TextField(
        // maxLength: 20,
        controller: emailController,
        decoration: new InputDecoration(
            counterStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
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
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            filled: true,
            errorStyle: TextStyle(height: 0),
            errorText: state is AuthenticationFailure ? '' : null,
            labelText: 'Email'));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  _onRegisterButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    authenticateBloc.add(RegisterUserEvent(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    ));
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    authenticateBloc.close();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
