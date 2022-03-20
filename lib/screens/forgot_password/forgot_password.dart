import 'package:flutter/material.dart';
import 'package:frienderr/widgets/app_logo/app_logo.dart';
import 'package:frienderr/widgets/app_button/app_button.dart';
import 'package:frienderr/widgets/app_text_field/app_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            resizeToAvoidBottomInset: false,
            body: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                iconSize: 35,
                                icon: Icon(
                                  Icons.close,
                                ),
                                onPressed: () => Navigator.pop(context)))),
                    AppLogo(
                      onFlightCompletion: () => setState(() => null),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 25, left: 20, right: 20),
                      child: Text(
                          "That's okay, it happens! Click on the button below to reset your password.",
                          style: TextStyle(color: Colors.grey[400])),
                    ),
                    AppTextField(
                        label: "Email",
                        isObscure: false,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        controller: emailController),
                    AppButton(
                      label: "Send Recovery Email",
                      margin: const EdgeInsets.only(top: 20),
                      onPressed: () => null,
                      isLoading: false,
                    )
                  ],
                ))));
  }
}
