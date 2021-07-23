import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/widgets/keyboard_builder/keyboard_builder.dart';

class RegisterUsername extends StatefulWidget {
  final String userId;
  RegisterUsername({Key? key, required this.userId}) : super(key: key);

  @override
  RegisterUsernameState createState() => RegisterUsernameState();
}

class RegisterUsernameState extends State<RegisterUsername> {
  bool isUsernameEmpty = true;
  final TextEditingController usernameController = TextEditingController();
  late final AuthenticationBloc authenticationBloc = new AuthenticationBloc();

  @override
  void initState() {
    usernameController.addListener(() {
      setState(() {
        isUsernameEmpty = !(usernameController.text != '');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state is AuthenticationFailure) {
            _onWidgetDidBuild(() {
              return FlashMessage.buildErrorSnackbar(context, state.error);
            });
          }
          return SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(30.0),
                            margin: const EdgeInsets.only(top: 40.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Choose A Username\n',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Helvetica'),
                                  ),
                                  usernameTextFieldWidget(state),
                                  usernameButtonWidget(),
                                  loadingWidget(state)
                                ]))
                        // new Padding(padding: new EdgeInsets.all(20.0),child:button,),
                        ,
                      ],
                    ),
                  )));
        });
  }

  Widget loadingWidget(AuthenticationState state) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        child: state is RegisterUsernameLoading
            ? new CupertinoActivityIndicator()
            : Center());
  }

  Widget usernameButtonWidget() {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(color: Colors.transparent))),
                backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#FFFFFF').withOpacity(isUsernameEmpty ? 0.7 : 1)),
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 55))),
            child: Text('Continue', style: TextStyle(color: Colors.black)),
            onPressed: isUsernameEmpty
                ? null
                : () {
                    _onRegisterButtonPressed(context);
                  },
          ));
    });
  }

  Widget usernameTextFieldWidget(AuthenticationState state) {
    return TextField(
        maxLength: 20,
        obscureText: false,
        controller: usernameController,
        decoration: new InputDecoration(
            counterStyle: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: new OutlineInputBorder(
              // borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: state is AuthenticationFailure ? '' : null,
            prefixIcon: Icon(Icons.person, color: Colors.grey),
            filled: true,
            labelText: 'Username',
            contentPadding: const EdgeInsets.only(top: 40.0)));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  _onRegisterButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    authenticationBloc.add(RegisterUsernameEvent(
      context: context,
      userId: widget.userId,
      username: usernameController.text,
    ));
  }

  @override
  void dispose() {
    authenticationBloc.close();
    usernameController.dispose();
    super.dispose();
  }
}
