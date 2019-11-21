import 'package:moor_flutter/moor_flutter.dart';

class Themes extends Table{
  IntColumn get id=>integer()();
  TextColumn get name=>text()();
}