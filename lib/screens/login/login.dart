import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/widgets/util/helpers.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/widgets/app_footer/app_footer.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/social_vector/social_vector.dart';

import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';
import 'package:frienderr/screens/forgot_password/forgot_password.dart';
import 'package:frienderr/screens/register/register_user/register_user.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Login extends StatefulWidget {
  final UserBloc userBloc;
  final AuthenticationBloc authenticationBloc;
  Login({Key? key, required this.userBloc, required this.authenticationBloc})
      : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<Login> {
  bool shouldRenderUI = false;

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

  void navigateToRegisterScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: RegisterUser(
                userBloc: widget.userBloc,
                authenticationBloc: widget.authenticationBloc),
            type: transition.PageTransitionType.slideInLeft));
  }

  void navigateToForgotScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: ForgotPasswordScreen(),
            type: transition.PageTransitionType.slideInLeft));
  }

  void onAuthenticate(BuildContext context) {
    FocusScope.of(context).unfocus();
    widget.authenticationBloc.add(LoginButtonPressed(
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              reverse: true,
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  bloc: widget.authenticationBloc,
                  listener: (
                    BuildContext context,
                    AuthenticationState state,
                  ) {
                    if (state is AuthenticationFailure) {
                      FlashMessage.buildErrorSnackbar(context, state.error);
                    }

                    if (state is AuthenticationSuccess) {
                      widget.userBloc.add(SetUser(user: state.user));

                      Navigator.pushAndRemoveUntil(
                        context,
                        transition.PageTransition(
                            child: MainTab(),
                            type: transition.PageTransitionType.slideInLeft),
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
                        onFlightCompletion: () =>
                            setState(() => shouldRenderUI = true),
                      ),
                      ConditionalRenderDelegate(
                          condition: shouldRenderUI,
                          renderWidget: appBody(state),
                          fallbackWidget: Center())
                    ]);
                  }),
            )));
  }

  Widget registerAccountText() {
    return Center(
        child: Text.rich(TextSpan(
            text: "\nDon't have an account. Register",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize:
                  const AdaptiveTextSize().getAdaptiveTextSize(context, 9.5),
            ),
            children: <InlineSpan>[
          TextSpan(
              text: ' here',
              recognizer: new TapGestureRecognizer()
                ..onTap = () => navigateToRegisterScreen(),
              style: TextStyle(
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 9.5),
                  color: HexColor('#FFB126')))
        ])));
  }

  Widget forgotPassword() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Align(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(
                text: "Forgot password? Click",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 9.5),
                ),
                children: <InlineSpan>[
                  TextSpan(
                      text: ' here',
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => navigateToForgotScreen(),
                      style: TextStyle(
                          fontSize: const AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 9.5),
                          color: HexColor('#FFB126')))
                ]))));
  }

  Widget appBody(AuthenticationState state) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(children: [
                        AppTextField(
                            label: "Email",
                            isObscure: false,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            controller: emailController,
                            errorText:
                                state is AuthenticationFailure ? '' : null),
                        AppTextField(
                            label: "Password",
                            isObscure: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 21.5,
                              color: Colors.grey,
                            ),
                            controller: passwordController,
                            padding: const EdgeInsets.only(top: 15),
                            errorText: state is AuthenticationFailure
                                ? state.error
                                : null),
                        AppButton(
                          label: "Login",
                          margin: const EdgeInsets.only(top: 20),
                          onPressed: () => onAuthenticate(context),
                          isLoading: state is AuthenticationLoading,
                        ),
                        registerAccountText(),
                        SocialVector(vector: Constants.authVector),
                      ])),
                  AppFooter(child: forgotPassword()),
                ])))));
  }
}
