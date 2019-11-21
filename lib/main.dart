import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/ui/bloc/state/theme_state.dart';
import 'package:starter/ui/home/home_page.dart';
import 'ui/bloc/theme_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,

      ),
    );
  }
}

Widget _buildWithTheme(BuildContext context,ThemeState state){
  return MaterialApp(
      title: 'Flutter Demo',
      theme: state.themeData,
      home: HomePage(),
    );
}

