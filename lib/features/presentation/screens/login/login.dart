import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/exceptions/exceptions.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/widgets/oauth.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class LoginScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final bool shouldRenderUI;
  const LoginScreen({
    Key? key,
    required this.blocGroup,
    this.shouldRenderUI = true,
  }) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  late bool _shouldRenderUI;
  BlocGroup get _blocGroup => widget.blocGroup;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    setState(() => _shouldRenderUI = widget.shouldRenderUI);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<dynamic> _navigateToRegisterScreen() {
    return getService<AppRouter>().push(RegisterRoute(
      blocGroup: _blocGroup,
    ));
  }

  Future<dynamic> _navigateToForgotScreen() async {
    return getService<AppRouter>().push(ForgotPasswordRoute(
      blocGroup: _blocGroup,
    ));
  }

  Future<dynamic> _navigateToTimeline(AuthenticationState state) async {
    _blocGroup.userBloc.add(UserEvent.setUser(state.user as UserModel));
    _blocGroup.snapBloc.add(const SnapEvent.initialize());
    _blocGroup.storyBloc.add(StoryEvent.fetchStories(userId: state.user!.id));
    _blocGroup.postBloc
        .add(const PostEvent.fetchTimelinePosts(shouldLoad: true));

    return getService<AppRouter>()
        .push(TabNavigationRoute(blocGroup: _blocGroup));
  }

  void _onProviderAuthenticate(OAuthType oAuth) {
    if (oAuth == OAuthType.google) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.googleSignIn());
    } else if (oAuth == OAuthType.facebook) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.facebookSignIn());
    } else if (oAuth == OAuthType.twitter) {
      _blocGroup.authenticationBloc
          .add(const AuthenticationEvent.twitterSignIn());
    }
  }

  void _listenableHandler(
    BuildContext context,
    AuthenticationState state,
  ) {
    if (state.currentState == AuthenticationStatus.authenticationFailure) {
      if (state.error == Errors.socialCancelled) {
        getService<AppRouter>().context.showToast(
            type: SnackBarType.error,
            content: Text(state.error,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.4))));
      }
    }

    if (state.currentState == AuthenticationStatus.authenticationSuccess) {
      _navigateToTimeline(state);
    }
  }

  void _onAuthenticate() {
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
            resizeToAvoidBottomInset: true,
            backgroundColor: Theme.of(context).canvasColor,
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  bloc: _blocGroup.authenticationBloc,
                  listener: _listenableHandler,
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
                        fallbackWidget: const Center(),
                        renderWidget: _animationLimiter(child: _appBody(state)),
                      )
                    ]);
                  }),
            )));
  }

  Widget _appBody(AuthenticationState state) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 30.0, right: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _oAuthActions(),
            _orDivider(),
            _usernameOrEmailTextField(state),
            _passwordTextField(state),
            _loginActions(),
            _loginButton(state),
            _registerAccountText(),
            _buildLoading(state),
            _buildAnimation(),
          ])),
    ]);
  }

  Widget _animationLimiter({required Widget child}) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                verticalOffset: 50.0, child: FadeInAnimation(child: child))));
  }

  Widget _buildLoading(state) {
    if (state.currentState == AuthenticationStatus.authenticationLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: LoadingIndicator(size: Size.fromRadius(40)),
        ),
      );
    } else {
      return const Center();
    }
  }

  Widget _usernameOrEmailTextField(state) {
    String? errorText;
    if (state.currentState == AuthenticationStatus.authenticationFailure) {
      if (state.error != Errors.socialCancelled) {
        errorText = '';
      }
    }

    return AppTextField(
      isObscure: false,
      errorText: errorText,
      label: "Username, email or phone number",
      /* prefixIcon: const Icon(
        Icons.person,
        color: Colors.grey,
      ),*/
      controller: _emailController,
    );
  }

  Widget _passwordTextField(state) {
    String? errorText;
    if (state.currentState == AuthenticationStatus.authenticationFailure) {
      if (state.error != Errors.socialCancelled) {
        errorText = state.error;
      }
    }

    return AppTextField(
      label: "Password",
      isObscure: true,
      /*  prefixIcon: const Icon(
        Icons.lock,
        size: 21.5,
        color: Colors.grey,
      ),*/
      errorText: errorText,
      controller: _passwordController,
      padding: const EdgeInsets.only(top: 15),
    );
  }

  Widget _loginButton(AuthenticationState state) {
    return SizedBox(
        child: AppButton(
            label: "LOGIN",
            isLoading: false,
            onPressed: _onAuthenticate,
            margin: const EdgeInsets.only(top: 15),
            disabled: state.currentState ==
                AuthenticationStatus.authenticationLoading),
        height: 60);
  }

  Widget _buildAnimation() {
    return Center(
      child: Lottie.asset(
        Assets.lottie.socialMediaNetwork,
        width: 300,
        height: 300,
      ),
    );
  }

  Widget _registerAccountText() {
    return Center(
        child: Text.rich(TextSpan(
            text: "\n\nDon't have an account.",
            style: TextStyle(
              color: Colors.grey[400]!.withOpacity(0.9),
              fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
            ),
            children: <InlineSpan>[
          TextSpan(
              text: ' Sign Up',
              recognizer: TapGestureRecognizer()
                ..onTap = () => _navigateToRegisterScreen(),
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
                  color: HexColor('#FFB126')))
        ])));
  }

  Widget _oAuthActions() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: OAuthHandler(
          onSelected: _onProviderAuthenticate,
        ),
      ),
    );
  }

  Widget _orDivider() {
    return Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 25),
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

  Widget _loginActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*  Row(children: [
            Switch(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
            Text('Remember Me', style: Theme.of(context).textTheme.bodyText1)
          ])*/
          const Center(),
          GestureDetector(
              onTap: _navigateToForgotScreen,
              child: Text('Forgot password?',
                  style: Theme.of(context).textTheme.bodyText1))
        ],
      ),
    );
  }
}
