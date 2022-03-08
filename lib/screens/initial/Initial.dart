import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/screens/register/registerUser/registerUser.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class Intiial extends StatefulWidget {
  Intiial({Key? key}) : super(key: key);

  @override
  IntiialState createState() => IntiialState();
}

class IntiialState extends State<Intiial> {
  navigateToRegisterUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterUser()));
    /* Navigator.push(
        context,
        transition.PageTransition(
            child: RegisterUser(),
            type: transition.PageTransitionType.slideInLeft));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(Constants.intialAppImage, height: 450, width: 450),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(31),
                child: Column(children: <Widget>[
                  Text('Share & Make Friends.\n\n',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      )),
                  Text(
                      'Tap into the power of social media and see life from a different perspective\n\n',
                      style: TextStyle(
                          //  color: Colors.white,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                          fontFamily: 'Inter')),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.transparent))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).buttonColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(double.infinity, 55))),
                      child: Text('Get Started',
                          style:
                              TextStyle(color: Theme.of(context).canvasColor)),
                      onPressed: () => navigateToRegisterUser()
                      /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterUser()))*/

                      ),
                  Text.rich(TextSpan(
                      text: "\nAlready have an account? ",
                      style: TextStyle(
                        //  color: Colors.white,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.45),
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'Login',
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()))
                            /*  Navigator.push(
                               Navigator.push(
                                  context,
                                  transition.PageTransition(
                                      child: Login(),
                                      type: transition
                                          .PageTransitionType.slideInLeft))*/

                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login())
                                      )*/
                            ,
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.5)))
                      ])),
                ])))
      ],
    )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
