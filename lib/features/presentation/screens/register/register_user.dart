import 'package:frienderr/core/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/widgets/oauth.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class RegisterScreen extends StatefulWidget {
  final BlocGroup blocGroup;

  const RegisterScreen({
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
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onProviderAuthenticate(OAuthType oAuth) {
    if (oAuth == OAuthType.google) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.googleSignUp());
    } else if (oAuth == OAuthType.facebook) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.facebookSignUp());
    } else if (oAuth == OAuthType.twitter) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.twitterSignUp());
    }
  }

  _onRegisterButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    _blocGroup.authenticationBloc.add(AuthenticationEvent.createAccount(
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  void _navigateToLoginScreen() => getService<AppRouter>().pop();

  void _navigateToRegisterUsername(AuthenticationState state) {
    _blocGroup.userBloc.add(UserEvent.setUser(state.user as UserModel));
    getService<AppRouter>().pushAndPopUntil(
        RegisterUsernameRoute(
          userId: state.user?.id ?? '',
          blocGroup: _blocGroup,
        ),
        predicate: (r) => false);
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
                                  AuthenticationStatus.authenticationFailure) {
                                getService<AppRouter>().context.showToast(
                                    type: SnackBarType.error,
                                    content: Text(state.error,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.4))));
                              }

                              if (state.currentState ==
                                  AuthenticationStatus.createAccountSuccess) {
                                _navigateToRegisterUsername(state);
                              }
                            },
                            builder: (
                              BuildContext context,
                              AuthenticationState state,
                            ) {
                              return Column(children: [
                                _closeButton(),
                                AppLogo(
                                  onFlightCompletion: () => null,
                                ),
                                _appBody(state),
                              ]);
                            })))));
  }

  Widget _closeButton() {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 27,
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context))));
  }

  Widget _buildAuthVector() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child:
          Image.asset(Assets.images.authVector2.path, height: 330, width: 330),
    ));
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
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 30.0, right: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildAuthVector(),
            _buildEmailField(state),
            // _buildPhoneNumberField(state),
            _buildPasswordField(state),
            _buildRegisterButton(state),
            _orDivider(),
            _oAuthActions(),

            _buildAccountText(),
            if (state.currentState == AuthenticationStatus.createAccountLoading)
              const Center(
                child: Padding(
                    child: LoadingIndicator(size: Size.fromRadius(40)),
                    padding: EdgeInsets.only(top: 20)),
              )
          ])),
    ]);
  }

  Widget _buildEmailField(AuthenticationState state) {
    return AppTextField(
        label: "Email Address",
        isObscure: false,
        controller: emailController,
        padding: const EdgeInsets.only(
          top: 1,
        ),
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.grey,
        ),
        errorText:
            state.currentState == AuthenticationStatus.createAccountFaliure
                ? ''
                : null);
  }

  Widget _buildPhoneNumberField(AuthenticationState state) {
    return AppTextField(
        label: "Phone Number",
        isObscure: false,
        prefixIcon: const Icon(
          Icons.phone,
          color: Colors.grey,
        ),
        padding: const EdgeInsets.only(top: 17),
        controller: passwordController,
        errorText:
            state.currentState == AuthenticationStatus.createAccountFaliure
                ? ''
                : null);
  }

  Widget _buildPasswordField(AuthenticationState state) {
    return AppTextField(
        label: "Password",
        isObscure: true,
        prefixIcon: const Icon(
          Icons.lock,
          size: 21.5,
          color: Colors.grey,
        ),
        controller: passwordController,
        padding: const EdgeInsets.only(top: 17),
        errorText:
            state.currentState == AuthenticationStatus.createAccountFaliure
                ? state.error
                : null);
  }

  Widget _buildRegisterButton(AuthenticationState state) {
    return SizedBox(
      height: 70,
      child: AppButton(
          label: "Create Account",
          borderRadius: 30,
          margin: const EdgeInsets.only(top: 20),
          onPressed: () => _onRegisterButtonPressed(context),
          isLoading: false,
          disabled:
              state.currentState == AuthenticationStatus.createAccountLoading),
    );
  }

  Widget _oAuthActions() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: /* OAuthHandler(
          onSelected: _onProviderAuthenticate,
        )*/
            MaterialButton(
          height: 60,
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            _onProviderAuthenticate(OAuthType.google);
          },
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.grey[800]!.withOpacity(0.3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Constants.googleIcon, height: 30, width: 30),
              Text("Sign up with google",
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]!))
            ],
          ),
        ),
      ),
    );
  }

  Widget _orDivider() {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20),
        child: Row(children: <Widget>[
          Expanded(
              child: Divider(
            height: 5,
            thickness: 2,
            endIndent: 0,
            color: Colors.grey[900],
          )),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("OR"),
          ),
          Expanded(
              child: Divider(
            height: 5,
            thickness: 2,
            endIndent: 0,
            color: Colors.grey[900],
          )),
        ]));
  }

  Widget _buildAnimation() {
    return Center(
      child: Lottie.asset(
        Assets.lottie.socialMediaInteraction,
        width: 290,
        height: 290,
      ),
    );
  }

  Widget _buildAccountText() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text.rich(TextSpan(
                text: "\nAlreay have an account?. Login",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 13,
                ),
                children: <InlineSpan>[
                  TextSpan(
                      text: ' here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _navigateToLoginScreen(),
                      style: const TextStyle(
                          fontSize: 13, color: Colors.orangeAccent))
                ]))));
  }
}
