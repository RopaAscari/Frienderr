import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const ForgotPasswordScreen({
    Key? key,
    required this.blocGroup,
  }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  BlocGroup get _blocGroup => widget.blocGroup;

  Future<dynamic> _navigateToRecoverEmail() async {
    return getService<AppRouter>().push(RecoveryEmailSentRoute(
      blocGroup: _blocGroup,
    ));
  }

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                bloc: _blocGroup.authenticationBloc,
                listener: (
                  BuildContext context,
                  AuthenticationState state,
                ) {
                  if (state.currentState ==
                      AuthenticationStatus.recoverAccountFailure) {
                    FlashMessage.buildErrorSnackbar(context, state.error);
                  }

                  if (state.currentState ==
                      AuthenticationStatus.recoverAccountSuccess) {
                    _navigateToRecoverEmail();
                  }
                },
                builder: (
                  BuildContext context,
                  AuthenticationState state,
                ) {
                  return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          _closeButton(),
                          AppLogo(
                            onFlightCompletion: () => setState(() => null),
                          ),
                          _appForm(state)
                        ],
                      ));
                })));
  }

  Widget _closeButton() {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context))));
  }

  Widget _appForm(AuthenticationState state) {
    return Column(children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 25, left: 20, right: 20),
        child: Text(
            "That's okay, it happens! Click on the button below to reset your password.",
            style: TextStyle(color: Colors.grey[400])),
      ),
      AppTextField(
          label: "Email",
          isObscure: false,
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
          controller: emailController),
      SizedBox(
          height: 80,
          child: AppButton(
            label: "Send Recovery Email",
            borderRadius: 30,
            margin: const EdgeInsets.only(top: 25),
            onPressed: () => _blocGroup.authenticationBloc.add(
                AuthenticationEvent.recoverAccount(
                    email: emailController.text)),
            isLoading: state.currentState ==
                AuthenticationStatus.recoverAccountLoading,
          ))
    ]);
  }
}
