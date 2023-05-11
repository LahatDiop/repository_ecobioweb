import 'package:moor_flutter/moor_flutter.dart';
//parte 'moor_database.g.dart' ;

@UseMoor(tables:[Orders])

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get price => text()();
  TextColumn get productName => text()();
}



