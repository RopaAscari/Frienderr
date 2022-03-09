import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/widgets/util/helpers.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';
import 'package:frienderr/screens/register/registerUser/registerUser.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  String? errors = '';
  bool isLoading = false;
  bool canPasswordShow = true;
  bool isUsernameEmpty = true;
  bool isPasswordEmpty = true;
  bool shouldRenderUI = false;

  final AuthenticationBloc authenticationBloc = new AuthenticationBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        isUsernameEmpty = !(emailController.text != '');
      });
    });

    passwordController.addListener(() {
      setState(() {
        isPasswordEmpty = !(passwordController.text != '');
      });
    });
  }

  navigateToRegisterScreen() {
    Navigator.push(
        context,
        transition.PageTransition(
            child: RegisterUser(),
            type: transition.PageTransitionType.slideInLeft));
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state is AuthenticationFailure) {
            //_controller.reset();
          }
        },
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          return Column(children: [
            appLogoVector(),
            ConditionalRenderDelegate(
                condition: shouldRenderUI,
                renderWidget: appBody(state),
                fallbackWidget: Center())
          ]);
        });
  }

  Widget appBody(state) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: Column(children: [
                  Container(
                      margin: const EdgeInsets.only(),
                      child: emailTextField(state)),
                  Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: passwordTextField(state)),
                  Container(
                      margin: EdgeInsets.only(top: 25
                          //isKeyboardVisible ? 25.0 : 240
                          ),
                      child: Column(children: [
                        loginButton(context, state),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text.rich(TextSpan(
                                text: "Don't have an account. Register",
                                style: TextStyle(
                                  fontSize: const AdaptiveTextSize()
                                      .getAdaptiveTextSize(context, 9.5),
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: ' here',
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap =
                                            () => navigateToRegisterScreen(),
                                      style: TextStyle(
                                          fontSize: const AdaptiveTextSize()
                                              .getAdaptiveTextSize(
                                                  context, 9.5),
                                          color: HexColor('#FFB126')))
                                ]))),
                        socialVector()
                      ])),
                ])))));
  }

  Widget appLogoVector() {
    final Widget appLogo = Align(
        alignment: Alignment.topCenter,
        child: Image.asset(Constants.appLogo, width: 200));
    return Hero(
        flightShuttleBuilder: (_, animation, __, ___, ____) {
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              this.setState(() {
                shouldRenderUI = true;
              });
            }
          });
          return appLogo;
        },
        tag: Constants.heroTag,
        child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 25), child: appLogo));
  }

  Widget socialVector() {
    return Padding(
        padding: EdgeInsets.only(top: 110),
        child: Image.asset(
          Constants.authVector,
        ));
  }

  Widget loginButton(BuildContext _, AuthenticationState state) {
    List<Color> colors = state is LoginLoading
        ? [Colors.grey[400]!, Colors.grey[300]!]
        : [HexColor('#E09810'), HexColor('#FEDA43')];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: const Alignment(-0.95, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: colors,
          stops: const [0.0, 1.0],
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: ConditionalRenderDelegate(
            condition: state is LoginLoading,
            renderWidget: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: HexColor('#FA5B8E'),
                  strokeWidth: 3,
                )),
            fallbackWidget: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      const AdaptiveTextSize().getAdaptiveTextSize(_, 11.5)),
            )),
        onPressed: () => _onLoginButtonPressed(context),
      ),
    );
  }

  Widget emailTextField(AuthenticationState state) {
    return TextField(
        obscureText: false,
        controller: emailController,
        // style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[800]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[600]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorStyle: TextStyle(height: 0, color: HexColor('#FA55B8E')),
            errorText: state is AuthenticationFailure ? '' : null,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            filled: true,
            labelText: 'Email',
            fillColor: HexColor('#9C9C9C').withOpacity(0.1),
            contentPadding: const EdgeInsets.only(top: 40.0)));
  }

  Widget passwordTextField(AuthenticationState state) {
    return TextField(
        obscureText: canPasswordShow,
        controller: passwordController,
        //   style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[800]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 21.5,
            ),
            suffixIcon: !canPasswordShow
                ? IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility_off,
                      size: 21.5,
                    ))
                : IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        canPasswordShow = !canPasswordShow;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility,
                      size: 21.5,
                    )),
            //  fillColor: HexColor('#C4C4C4').withOpacity(0.5),
            filled: true,
            //  errorStyle: TextStyle(height: 0),
            errorText: state is AuthenticationFailure ? state.error : null,
            labelText: 'Password'));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    authenticationBloc.add(LoginButtonPressed(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    ));
  }
}
