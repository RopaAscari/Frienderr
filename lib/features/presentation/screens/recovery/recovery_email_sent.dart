import 'package:flutter/material.dart';

import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';

import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/widgets/app_logo.dart';

class RecoveryEmailSentScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const RecoveryEmailSentScreen({
    Key? key,
    required this.blocGroup,
  }) : super(key: key);

  @override
  State<RecoveryEmailSentScreen> createState() =>
      _RecoveryEmailSentScreenState();
}

class _RecoveryEmailSentScreenState extends State<RecoveryEmailSentScreen> {
  BlocGroup get _blocGroup => widget.blocGroup;

  Future<Object?> _navigateToLoginScreen() async {
    return await getIt<AppRouter>().push(LoginRoute(blocGroup: _blocGroup));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLogo(onFlightCompletion: () => null),
                      Center(
                          child: Text("Your password link was sent!",
                              style: TextStyle(
                                  fontSize: AdaptiveTextSize()
                                      .getAdaptiveTextSize(context, 15),
                                  color: Colors.grey[400]))),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                          ),
                          child: Text(
                              "We've sent you a link to recover your acountvia your email address. Please follow the instructions to reset your password. ",
                              style: TextStyle(color: Colors.grey[400]))),
                      Image.asset(Constants.resetPasswordVector),
                      AppButton(
                        isLoading: false,
                        label: "Proceed to Login",
                        margin: const EdgeInsets.only(top: 20),
                        onPressed: () => _navigateToLoginScreen(),
                      )
                    ]))));
  }
}
