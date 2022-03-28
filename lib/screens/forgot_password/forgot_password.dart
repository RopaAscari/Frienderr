import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/screens/forgot_password/recovery_email_sent/recovery_email_sent.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final UserBloc userBloc;
  final AuthenticationBloc authenticationBloc;
  const ForgotPasswordScreen(
      {Key? key, required this.authenticationBloc, required this.userBloc})
      : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  _navigateToRecoverEmail() => Navigator.pushAndRemoveUntil(
        context,
        transition.PageTransition(
            child: RecoveryEmailSentScreen(
              userBloc: widget.userBloc,
              authenticationBloc: widget.authenticationBloc,
            ),
            type: transition.PageTransitionType.slideInLeft),
        (Route<dynamic> route) => false,
      );

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                bloc: widget.authenticationBloc,
                listener: (
                  BuildContext context,
                  AuthenticationState state,
                ) {
                  if (state.currentState ==
                      AuthenticationStatus.RecoverAccountFailure) {
                    FlashMessage.buildErrorSnackbar(context, state.error);
                  }

                  if (state.currentState ==
                      AuthenticationStatus.RecoverAccountSuccess) {
                    _navigateToRecoverEmail();
                  }
                },
                builder: (
                  BuildContext context,
                  AuthenticationState state,
                ) {
                  return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          _closeButton(),
                          AppLogo(
                            onFlightCompletion: () => setState(() => null),
                          ),
                          _appForm(state)
                        ],
                      ));
                })));
  }

  Widget _closeButton() {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context))));
  }

  Widget _appForm(AuthenticationState state) {
    return Column(children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 25, left: 20, right: 20),
        child: Text(
            "That's okay, it happens! Click on the button below to reset your password.",
            style: TextStyle(color: Colors.grey[400])),
      ),
      AppTextField(
          label: "Email",
          isObscure: false,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          controller: emailController),
      AppButton(
        label: "Send Recovery Email",
        margin: const EdgeInsets.only(top: 20),
        onPressed: () => widget.authenticationBloc.add(
            AuthenticationEvent.recoverAccount(email: emailController.text)),
        isLoading:
            state.currentState == AuthenticationStatus.RecoverAccountLoading,
      )
    ]);
  }
}
