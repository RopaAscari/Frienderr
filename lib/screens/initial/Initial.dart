import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:frienderr/screens/register/registerUser/registerUser.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/screens/register/registerUsername/registerUsername.dart';

class Intiial extends StatefulWidget {
  Intiial({Key? key}) : super(key: key);

  @override
  IntiialState createState() => IntiialState();
}

class IntiialState extends State<Intiial> {
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
                        fontSize: 28,
                      )),
                  Text(
                      'Tap into the power of social media and see life from a different perspective\n\n',
                      style: TextStyle(
                          //  color: Colors.white,
                          fontSize: 15.5,
                          fontFamily: 'Inter')),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.transparent))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FFFFFF')),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(double.infinity, 55))),
                      child: Text('Get Started',
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                                context,
                                transition.PageTransition(
                                    child: RegisterUser(),
                                    type: transition
                                        .PageTransitionType.slideInLeft))

                            /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterUser()))*/
                            ;
                      }),
                  Text.rich(TextSpan(
                      text: "\nAlready have an account? ",
                      style: TextStyle(
                        //  color: Colors.white,
                        fontSize: 14.5,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'Login',
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  transition.PageTransition(
                                      child: Login(),
                                      type: transition
                                          .PageTransitionType.slideInLeft))

                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login())
                                      )*/
                            ,
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 15.5,
                            ))
                      ])),
                ])))
      ],
    )));
  }
}
