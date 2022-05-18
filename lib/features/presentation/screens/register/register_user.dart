import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
import 'package:frienderr/features/presentation/screens/register/register_username.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';
import 'package:frienderr/features/presentation/widgets/social_vector.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RegisterScreen extends StatefulWidget {
  final BlocGroup blocGroup;

  RegisterScreen({
    Key? key,
    required this.blocGroup,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  BlocGroup get _blocGroup => widget.blocGroup;
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
    getIt<AppRouter>().context.showLoadingIndicator();
    FocusScope.of(context).unfocus();
    _blocGroup.authenticationBloc.add(AuthenticationEvent.createAccount(
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  void _navigateToLoginScreen() => getIt<AppRouter>().push(LoginRoute(
        shouldRenderUI: true,
        blocGroup: _blocGroup,
      ));

  void _navigateToRegisterUsername(AuthenticationState state) {
    _blocGroup.userBloc.add(UserEvent.setUser(state.user as UserModel));
    getIt<AppRouter>().push(RegisterUsernameRoute(
      userId: state.user?.id ?? '',
      blocGroup: _blocGroup,
    ));
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
                    child:
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                            bloc: _blocGroup.authenticationBloc,
                            listener: (
                              BuildContext context,
                              AuthenticationState state,
                            ) {
                              if (state.currentState ==
                                  AuthenticationStatus.AuthenticationFailure) {
                                getIt<AppRouter>()
                                    .context
                                    .dismissLoadingIndicator();
                              }

                              if (state.currentState ==
                                  AuthenticationStatus.CreateAccountSuccess) {
                                getIt<AppRouter>()
                                    .context
                                    .dismissLoadingIndicator();
                                _navigateToRegisterUsername(state);
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
                                SocialVector(vector: Constants.registerVector),
                                _appBody(state),
                              ]);
                            })))));
  }

  Widget _appBody(AuthenticationState state) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: _appForm(state)))));
  }

  Widget _appForm(AuthenticationState state) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          AppTextField(
              label: "Email",
              isObscure: false,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              controller: emailController,
              errorText: state.currentState ==
                      AuthenticationStatus.CreateAccountFaliure
                  ? ''
                  : null),
          AppTextField(
              label: "Password",
              isObscure: true,
              prefixIcon: const Icon(
                Icons.lock,
                size: 21.5,
                color: Colors.grey,
              ),
              controller: passwordController,
              padding: const EdgeInsets.only(top: 17),
              errorText: state.currentState ==
                      AuthenticationStatus.CreateAccountFaliure
                  ? state.error
                  : null),
          AppButton(
              label: "Create Account",
              margin: const EdgeInsets.only(top: 20),
              onPressed: () => _onRegisterButtonPressed(context),
              isLoading: false),
          _accountText(),
        ]));
  }

  Widget _accountText() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text.rich(TextSpan(
                text: "\nAlreay have an account?. Login",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize:
                      const AdaptiveTextSize().getAdaptiveTextSize(context, 10),
                ),
                children: <InlineSpan>[
                  TextSpan(
                      text: ' here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _navigateToLoginScreen(),
                      style: TextStyle(
                          fontSize: const AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10),
                          color: Colors.orangeAccent))
                ]))));
  }
}
