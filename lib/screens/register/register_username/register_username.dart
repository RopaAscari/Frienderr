import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frienderr/services/services.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';

import 'package:frienderr/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class RegisterUsername extends StatefulWidget {
  final String userId;
  final AuthenticationBloc authenticationBloc;
  RegisterUsername(
      {Key? key, required this.userId, required this.authenticationBloc})
      : super(key: key);

  @override
  _RegisterUsernameState createState() => _RegisterUsernameState();
}

class _RegisterUsernameState extends State<RegisterUsername> {
  bool isUsernameEmpty = true;
  final TextEditingController usernameController = TextEditingController();
  late final AuthenticationBloc authenticationBloc = new AuthenticationBloc();

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  _onRegisterUsername(BuildContext context) {
    FocusScope.of(context).unfocus();
    widget.authenticationBloc.add(AuthenticationEvent.registerUsername(
      userId: widget.userId,
      username: usernameController.text,
    ));
  }

  void navigateToDashboard() => Navigator.pushAndRemoveUntil(
        context,
        transition.PageTransition(
            child: MainTab(), type: transition.PageTransitionType.slideInLeft),
        (Route<dynamic> route) => false,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: widget.authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state.currentState ==
              AuthenticationStatus.RegisterUsernameFailure) {
            FlashMessage.buildErrorSnackbar(context, state.error);
          }

          if (state.currentState ==
              AuthenticationStatus.RecoverAccountSuccess) {
            navigateToDashboard();
          }
        },
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          return Container(
              color: Theme.of(context).canvasColor,
              child: SafeArea(
                  child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _closeButton(),
                            AppLogo(
                              onFlightCompletion: () => null,
                            ),
                            _appForm(state),
                          ],
                        ),
                      ))));
        });
  }

  Widget _closeButton() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () => navigateToDashboard())));
  }

  Widget _appForm(AuthenticationState state) {
    return Container(
        padding: const EdgeInsets.all(30.0),
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Create a username so that its easier to connect with friends and family.\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                //   color: Colors.white,
                fontSize: 15,
                fontFamily: 'Helvetica'),
          ),
          AppTextField(
              label: "Username",
              isObscure: false,
              prefixIcon: Icon(Icons.person, color: Colors.grey),
              controller: usernameController,
              padding: const EdgeInsets.only(top: 15),
              errorText: state.currentState ==
                      AuthenticationStatus.RegisterUsernameFailure
                  ? state.error
                  : null),
          AppButton(
              label: "Continue",
              margin: const EdgeInsets.only(top: 20),
              onPressed: () => _onRegisterUsername(context),
              isLoading: state.currentState ==
                  AuthenticationStatus.RegisterUsernameLoading),
        ]));
  }
}
