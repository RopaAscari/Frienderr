import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/widgets/util/helpers.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/widgets/app_footer/app_footer.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/social_vector/social_vector.dart';
import 'package:frienderr/blocs/authenticate/authenticate_bloc.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';
import 'package:frienderr/screens/forgot_password/forgot_password.dart';
import 'package:frienderr/screens/register/register_user/register_user.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Login extends StatefulWidget {
  final UserBloc userBloc;
  final bool shouldRenderUI;
  final AuthenticationBloc authenticationBloc;
  Login({
    Key? key,
    required this.userBloc,
    this.shouldRenderUI = false,
    required this.authenticationBloc,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  late bool _shouldRenderUI;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    this.setState(() => _shouldRenderUI = widget.shouldRenderUI);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToRegisterScreen() => Navigator.push(
      context,
      transition.PageTransition(
          child: RegisterUser(
              userBloc: widget.userBloc,
              authenticationBloc: widget.authenticationBloc),
          type: transition.PageTransitionType.slideInLeft));

  void _navigateToForgotScreen() => Navigator.push(
      context,
      transition.PageTransition(
          child: ForgotPasswordScreen(
              userBloc: widget.userBloc,
              authenticationBloc: widget.authenticationBloc),
          type: transition.PageTransitionType.slideInLeft));

  void _navigateToTimeline(AuthenticationState state) {
    widget.userBloc.add(SetUser(user: state.user as UserModel));

    Navigator.pushAndRemoveUntil(
      context,
      transition.PageTransition(
          child: MainTab(), type: transition.PageTransitionType.slideInLeft),
      (Route<dynamic> route) => false,
    );
  }

  void _onAuthenticate(BuildContext context) {
    FocusScope.of(context).unfocus();
    widget.authenticationBloc.add(AuthenticationEvent.onAuthenticate(
      email: _emailController.text,
      password: _passwordController.text,
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
                    if (state.currentState ==
                        AuthenticationStatus.AuthenticationFailure) {
                      FlashMessage.buildErrorSnackbar(context, state.error);
                    }

                    if (state.currentState ==
                        AuthenticationStatus.AuthenticationSuccess) {
                      _navigateToTimeline(state);
                    }
                  },
                  builder: (
                    BuildContext context,
                    AuthenticationState state,
                  ) {
                    return Column(children: [
                      AppLogo(
                        onFlightCompletion: () =>
                            setState(() => _shouldRenderUI = true),
                      ),
                      ConditionalRenderDelegate(
                        condition: _shouldRenderUI,
                        fallbackWidget: Center(),
                        renderWidget: _appBody(state),
                      )
                    ]);
                  }),
            )));
  }

  Widget _registerAccountText() {
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
                ..onTap = () => _navigateToRegisterScreen(),
              style: TextStyle(
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 9.5),
                  color: HexColor('#FFB126')))
        ])));
  }

  Widget _forgotPassword() {
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
                        ..onTap = () => _navigateToForgotScreen(),
                      style: TextStyle(
                          fontSize: const AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 9.5),
                          color: HexColor('#FFB126')))
                ]))));
  }

  Widget _appBody(AuthenticationState state) {
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
                            controller: _emailController,
                            errorText: state.currentState ==
                                    AuthenticationStatus.AuthenticationFailure
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
                            controller: _passwordController,
                            padding: const EdgeInsets.only(top: 15),
                            errorText: state.currentState ==
                                    AuthenticationStatus.AuthenticationFailure
                                ? state.error
                                : null),
                        AppButton(
                          label: "Login",
                          margin: const EdgeInsets.only(top: 20),
                          onPressed: () => _onAuthenticate(context),
                          isLoading: state.currentState ==
                              AuthenticationStatus.AuthenticationLoading,
                        ),
                        _registerAccountText(),
                        SocialVector(vector: Constants.authVector),
                      ])),
                  AppFooter(child: _forgotPassword()),
                ])))));
  }
}
