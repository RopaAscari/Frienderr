import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/keyboard_builder/keyboard_builder.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class RegisterUsername extends StatefulWidget {
  final String userId;
  final AuthenticationBloc authenticationBloc;
  RegisterUsername(
      {Key? key, required this.userId, required this.authenticationBloc})
      : super(key: key);

  @override
  RegisterUsernameState createState() => RegisterUsernameState();
}

class RegisterUsernameState extends State<RegisterUsername> {
  bool isUsernameEmpty = true;
  final TextEditingController usernameController = TextEditingController();
  late final AuthenticationBloc authenticationBloc = new AuthenticationBloc();

  @override
  void initState() {
    super.initState();
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
          if (state is AuthenticationFailure) {
            FlashMessage.buildErrorSnackbar(context, state.error);
          }

          if (state is RegisterUsernameSuccess) {
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
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        iconSize: 35,
                                        icon: Icon(
                                          Icons.close,
                                        ),
                                        onPressed: () =>
                                            navigateToDashboard()))),
                            AppLogo(
                              onFlightCompletion: () => null,
                            ),
                            Container(
                                padding: const EdgeInsets.all(30.0),
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                          prefixIcon: Icon(Icons.person,
                                              color: Colors.grey),
                                          controller: usernameController,
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          errorText:
                                              state is RegisterUserFailure
                                                  ? state.error
                                                  : null),
                                      AppButton(
                                        label: "Continue",
                                        margin: const EdgeInsets.only(top: 20),
                                        onPressed: () =>
                                            _onRegisterButtonPressed(context),
                                        isLoading:
                                            state is RegisterUsernameLoading,
                                      ),
                                    ]))
                            // new Padding(padding: new EdgeInsets.all(20.0),child:button,),
                            ,
                          ],
                        ),
                      ))));
        });
  }

  _onRegisterButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    widget.authenticationBloc.add(RegisterUsernameEvent(
      context: context,
      userId: widget.userId,
      username: usernameController.text,
    ));
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
}
