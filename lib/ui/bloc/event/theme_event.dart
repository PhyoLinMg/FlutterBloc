import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:starter/ui/app_theme.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const <dynamic>[]]) : super();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme
  }) : super([theme]);

  @override
  // TODO: implement props
  List<Object> get props => props;

  
}