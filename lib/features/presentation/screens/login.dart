import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/widgets/app_footer.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';
import 'package:frienderr/features/presentation/widgets/social_vector.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class LoginScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final bool shouldRenderUI;
  LoginScreen({
    Key? key,
    required this.blocGroup,
    this.shouldRenderUI = false,
  }) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late bool _shouldRenderUI;
  BlocGroup get _blocGroup => widget.blocGroup;
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

  Future<dynamic> _navigateToRegisterScreen() {
    return getIt<AppRouter>().push(RegisterRoute(
      blocGroup: _blocGroup,
    ));
  }

  Future<dynamic> _navigateToForgotScreen() async {
    return getIt<AppRouter>().push(ForgotPasswordRoute(
      blocGroup: _blocGroup,
    ));
  }

  Future<dynamic> _navigateToTimeline(AuthenticationState state) async {
    getIt<UserBloc>().add(UserEvent.setUser(state.user as UserModel));
    return getIt<AppRouter>().push(MainRoute(blocGroup: _blocGroup));
  }

  void _onAuthenticate(BuildContext context) {
    FocusScope.of(context).unfocus();
    _blocGroup.authenticationBloc.add(AuthenticationEvent.onAuthenticate(
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
                  bloc: _blocGroup.authenticationBloc,
                  listener: (
                    BuildContext context,
                    AuthenticationState state,
                  ) {
                    if (state.currentState ==
                        AuthenticationStatus.AuthenticationFailure) {
                      //  FlashMessage.buildErrorSnackbar(context, state.error);
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
