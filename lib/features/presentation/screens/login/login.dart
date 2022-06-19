import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/widgets/oauth.dart';

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
    _blocGroup.userBloc.add(UserEvent.setUser(state.user as UserModel));
    _blocGroup.quickBloc.add(const QuickEvent.initialize());
    _blocGroup.storyBloc.add(StoryEvent.loadStories(userId: state.user!.id));
    _blocGroup.postBloc
        .add(const PostEvent.fetchTimelinePosts(shouldLoad: true));

    return getIt<AppRouter>().push(MainRoute(blocGroup: _blocGroup));
  }

  void _onAuthenticate() {
    getIt<AppRouter>().context.showLoadingIndicator();
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
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  bloc: _blocGroup.authenticationBloc,
                  listener: (
                    BuildContext context,
                    AuthenticationState state,
                  ) {
                    if (state.currentState ==
                        AuthenticationStatus.AuthenticationFailure) {
                      getIt<AppRouter>().context.dismissLoadingIndicator();
                    }

                    if (state.currentState ==
                        AuthenticationStatus.AuthenticationSuccess) {
                      getIt<AppRouter>().context.dismissLoadingIndicator();
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
                        fallbackWidget: const Center(),
                        renderWidget: _animationLimiter(child: _appBody(state)),
                      )
                    ]);
                  }),
            )));
  }

  Widget _animationLimiter({required Widget child}) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                verticalOffset: 50.0, child: FadeInAnimation(child: child))));
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
            _loginButton(),
            _registerAccountText(),
          ])),
    ]);
  }

  Widget _usernameOrEmailTextField(state) {
    String? errorText;
    if (state.currentState == AuthenticationStatus.AuthenticationFailure) {
      errorText = state.error;
    }

    return SizedBox(
        child: AppTextField(
          isObscure: false,
          errorText: errorText,
          label: "Username or email",
          controller: _emailController,
        ),
        height: 65);
  }

  Widget _passwordTextField(state) {
    String? errorText;
    if (state.currentState == AuthenticationStatus.AuthenticationFailure) {
      errorText = state.error;
    }

    return SizedBox(
      child: AppTextField(
        label: "Password",
        isObscure: true,
        errorText: errorText,
        controller: _passwordController,
        padding: const EdgeInsets.only(top: 10),
      ),
      height: 65,
    );
  }

  Widget _loginButton() {
    return SizedBox(
        child: AppButton(
          label: "LOGIN",
          isLoading: false,
          onPressed: _onAuthenticate,
          margin: const EdgeInsets.only(top: 24),
        ),
        height: 80);
  }

  Widget _registerAccountText() {
    return Center(
        child: Text.rich(TextSpan(
            text: "\n\nDon't have an account.",
            style: TextStyle(
              color: Colors.grey[400]!.withOpacity(0.9),
              fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
            ),
            children: <InlineSpan>[
          TextSpan(
              text: ' Sign Up',
              recognizer: TapGestureRecognizer()
                ..onTap = () => _navigateToRegisterScreen(),
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
                  color: HexColor('#FFB126')))
        ])));
  }

  Widget _oAuthActions() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: OAuthHandler(
          onSelected: (oAuth) {
            //print(oAuth);
          },
        ),
      ),
    );
  }

  Widget _orDivider() {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 50),
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
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Switch(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
            Text('Remember Me', style: Theme.of(context).textTheme.bodyText1)
          ]),
          Text('Forgot password', style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}
