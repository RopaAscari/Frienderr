import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';

class RegisterUsernameScreen extends StatefulWidget {
  final String userId;
  final BlocGroup blocGroup;
  RegisterUsernameScreen({
    Key? key,
    required this.userId,
    required this.blocGroup,
  }) : super(key: key);

  @override
  _RegisterUsernameScreenState createState() => _RegisterUsernameScreenState();
}

class _RegisterUsernameScreenState extends State<RegisterUsernameScreen> {
  bool isUsernameEmpty = true;
  BlocGroup get _blocGroup => widget.blocGroup;
  final TextEditingController usernameController = TextEditingController();
  AuthenticationBloc get authenticationBloc => getIt<AuthenticationBloc>();

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  _onRegisterUsername(BuildContext context) {
    FocusScope.of(context).unfocus();
    _blocGroup.authenticationBloc.add(AuthenticationEvent.registerUsername(
      userId: widget.userId,
      username: usernameController.text,
    ));
  }

  Future<dynamic> _navigateToTimeline(AuthenticationState state) async {
    _blocGroup.userBloc.add(UserEvent.setUser(state.user as UserModel));
    return getIt<AppRouter>().push(MainRoute(blocGroup: _blocGroup));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: _blocGroup.authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) {
          if (state.currentState ==
              AuthenticationStatus.RegisterUsernameFailure) {
            //  FlashMessage.buildErrorSnackbar(context, state.error);
          }

          if (state.currentState ==
              AuthenticationStatus.RegisterUsernameSuccess) {
            _navigateToTimeline(state);
          }
        },
        builder: (
          BuildContext context,
          AuthenticationState state,
        ) {
          return Container(
              color: Theme.of(context).canvasColor,
              child: SafeArea(
                  child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _closeButton(state),
                            AppLogo(
                              onFlightCompletion: () => null,
                            ),
                            _appForm(state),
                          ],
                        ),
                      ))));
        });
  }

  Widget _closeButton(state) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () => _navigateToTimeline(state))));
  }

  Widget _appForm(AuthenticationState state) {
    return Container(
        padding: const EdgeInsets.all(30.0),
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Create a username so that its easier to connect with friends and family.\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                //   color: Colors.white,
                fontSize: 15,
                fontFamily: 'Helvetica'),
          ),
          AppTextField(
              label: "Username",
              isObscure: false,
              prefixIcon: Icon(Icons.person, color: Colors.grey),
              controller: usernameController,
              padding: const EdgeInsets.only(top: 15),
              errorText: state.currentState ==
                      AuthenticationStatus.RegisterUsernameFailure
                  ? state.error
                  : null),
          AppButton(
              label: "Continue",
              margin: const EdgeInsets.only(top: 20),
              onPressed: () => _onRegisterUsername(context),
              isLoading: state.currentState ==
                  AuthenticationStatus.RegisterUsernameLoading),
        ]));
  }
}
