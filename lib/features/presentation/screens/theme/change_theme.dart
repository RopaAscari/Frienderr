import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/themes/themes.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeTheme extends StatefulWidget {
  ChangeTheme({Key? key}) : super(key: key);

  ChangeThemeState createState() => ChangeThemeState();
}

class ChangeThemeState extends State<ChangeTheme> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
    );
  }

  _onThemeChange(String theme) {
    //BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: theme));
  }
}
