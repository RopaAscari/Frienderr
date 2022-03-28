import 'package:flutter/material.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/blocs/authenticate/authenticate_bloc.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/util/helpers.dart';

class RecoveryEmailSentScreen extends StatefulWidget {
  final UserBloc userBloc;
  final AuthenticationBloc authenticationBloc;
  const RecoveryEmailSentScreen(
      {Key? key, required this.userBloc, required this.authenticationBloc})
      : super(key: key);

  @override
  State<RecoveryEmailSentScreen> createState() =>
      _RecoveryEmailSentScreenState();
}

class _RecoveryEmailSentScreenState extends State<RecoveryEmailSentScreen> {
  _navigateToLoginScreen() => Navigator.pushAndRemoveUntil(
      context,
      transition.PageTransition(
          child: Login(
              userBloc: widget.userBloc,
              authenticationBloc: widget.authenticationBloc),
          type: transition.PageTransitionType.slideInLeft),
      (route) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLogo(onFlightCompletion: () => null),
                      Center(
                          child: Text("Your password link was sent!",
                              style: TextStyle(
                                  fontSize: AdaptiveTextSize()
                                      .getAdaptiveTextSize(context, 15),
                                  color: Colors.grey[400]))),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                          ),
                          child: Text(
                              "We've sent you a link to recover your acountvia your email address. Please follow the instructions to reset your password. ",
                              style: TextStyle(color: Colors.grey[400]))),
                      Image.asset(Constants.resetPasswordVector),
                      AppButton(
                        isLoading: false,
                        label: "Proceed to Login",
                        margin: const EdgeInsets.only(top: 20),
                        onPressed: () => _navigateToLoginScreen(),
                      )
                    ]))));
  }
}
