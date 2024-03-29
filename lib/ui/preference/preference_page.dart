import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/ui/bloc/theme_bloc.dart';
import 'package:starter/ui/bloc/event/theme_event.dart';
import 'package:toast/toast.dart';

import '../app_theme.dart';

class PreferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () {
              // Navigate to the PreferencePage
              Navigator.pop(context);
              Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[itemAppTheme].primaryColor,
            child: ListTile(
              title: Text(
                itemAppTheme.toString(),
                style: appThemeData[itemAppTheme].textTheme.body1,
              ),
              onTap: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(theme: itemAppTheme),
                );
              },
            ),
          );
        },
      ),
    );
  }
}