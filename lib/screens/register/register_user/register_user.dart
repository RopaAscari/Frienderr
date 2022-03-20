import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/social_vector/social_vector.dart';
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frienderr/screens/register/register_username/register_username.dart';

class RegisterUser extends StatefulWidget {
  final UserBloc userBloc;
  final AuthenticationBloc authenticationBloc;

  RegisterUser(
      {Key? key, required this.userBloc, required this.authenticationBloc})
      : super(key: key);

  @override
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State<RegisterUser> {
  AuthenticationBloc authenticateBloc = new AuthenticationBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _onRegisterButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    widget.authenticationBloc.add(RegisterUserEvent(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    ));
    FocusScope.of(context).unfocus();
  }

  void navigateToLoginScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: Login(
                userBloc: widget.userBloc,
                authenticationBloc: widget.authenticationBloc),
            type: transition.PageTransitionType.slideInLeft));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                    reverse: true,
                    child: BlocConsumer<AuthenticationBloc,
                            AuthenticationState>(
                        bloc: widget.authenticationBloc,
                        listener: (
                          BuildContext context,
                          AuthenticationState state,
                        ) {
                          if (state is AuthenticationFailure) {
                            FlashMessage.buildErrorSnackbar(
                                context, state.error);
                          }

                          if (state is RegisterUserSuccess) {
                            widget.userBloc.add(SetUser(user: state.user));

                            Navigator.pushAndRemoveUntil(
                              context,
                              transition.PageTransition(
                                  child: RegisterUsername(
                                      userId: state.user.id,
                                      authenticationBloc:
                                          widget.authenticationBloc),
                                  type: transition
                                      .PageTransitionType.slideInLeft),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        builder: (
                          BuildContext context,
                          AuthenticationState state,
                        ) {
                          return Column(children: [
                            AppLogo(
                              onFlightCompletion: () => null,
                            ),
                            AnimationLimiter(
                                child: AnimationConfiguration.staggeredList(
                                    position: 1,
                                    duration: const Duration(milliseconds: 500),
                                    child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                            child: Column(children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Column(children: [
                                                AppTextField(
                                                    label: "Email",
                                                    isObscure: false,
                                                    prefixIcon: Icon(
                                                      Icons.person,
                                                      color: Colors.grey,
                                                    ),
                                                    controller: emailController,
                                                    errorText: state
                                                            is RegisterUserFailure
                                                        ? ''
                                                        : null),
                                                AppTextField(
                                                    label: "Password",
                                                    isObscure: true,
                                                    prefixIcon: Icon(
                                                      Icons.lock,
                                                      size: 21.5,
                                                      color: Colors.grey,
                                                    ),
                                                    controller:
                                                        passwordController,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    errorText: state
                                                            is RegisterUserFailure
                                                        ? state.error
                                                        : null),
                                                AppButton(
                                                  label: "Create Account",
                                                  margin: const EdgeInsets.only(
                                                      top: 20),
                                                  onPressed: () =>
                                                      _onRegisterButtonPressed(
                                                          context),
                                                  isLoading: state
                                                      is RegisterUserEventLoading,
                                                ),
                                                Center(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "\nAlreay have an account?. Login",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      400],
                                                                  fontSize: ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          1.47),
                                                                ),
                                                                children: <
                                                                    InlineSpan>[
                                                              TextSpan(
                                                                  text: ' here',
                                                                  recognizer:
                                                                      new TapGestureRecognizer()
                                                                        ..onTap =
                                                                            () =>
                                                                                navigateToLoginScreen(),
                                                                  style: TextStyle(
                                                                      fontSize: ResponsiveFlutter.of(
                                                                              context)
                                                                          .fontSize(
                                                                              1.5),
                                                                      color: Colors
                                                                          .orangeAccent))
                                                            ])))),
                                                SocialVector(
                                                    vector: Constants
                                                        .registerVector),
                                              ])),
                                          // AppFooter(child: Center()),
                                        ])))))
                          ]);
                        })))));
  }
}
