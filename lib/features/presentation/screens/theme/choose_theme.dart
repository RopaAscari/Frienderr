import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/themes/themes.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';

class ChooseTheme extends StatefulWidget {
  ChooseTheme({Key? key}) : super(key: key);

  @override
  ChooseThemeState createState() => ChooseThemeState();
}

class ChooseThemeState extends State<ChooseTheme> {
  final ThemeBloc themeBloc = ThemeBloc();

  selectTheme() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Center()));
  }

  _onThemeChange(String theme) {
    // BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: theme));
  }

  @override
  void dispose() {
    super.dispose();
    themeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        BlocProvider.of<ThemeBloc>(context).state.theme == Constants.darkTheme;

    return Container(
        color: Theme.of(context).canvasColor,
        child: Scaffold(
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Text('\n\n\n      Choose Theme',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 17))),
          /* Container(
            height: 200,
            margin: const EdgeInsets.only(top: 200),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: AppTheme.values.length,
                itemBuilder: (context, index) {
                  final itemAppTheme = AppTheme.values[index];
                  final theme = itemAppTheme == AppTheme.Dark
                      ? Constants.darkTheme
                      : Constants.lightTheme;
                  return Card(
                    color: appThemeData[itemAppTheme]?.canvasColor,
                    child: ListTile(
                      title: Text(
                        theme,
                        style: appThemeData[itemAppTheme]?.textTheme.bodyText2,
                      ),
                      onTap: () {
                        _onThemeChange(theme);
                      },
                    ),
                  );
                },
              ))
            ]),
          ),*/

          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side:
                                        BorderSide(color: Colors.transparent))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).buttonColor),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(double.infinity, 55))),
                    child: Text(
                      'Select theme',
                      style: TextStyle(
                          fontSize: 14,
                          color: isDarkTheme
                              ? Theme.of(context).canvasColor
                              : Colors.white),
                    ),
                    onPressed: () => selectTheme(),
                  ))),
        ])));
  }
}
