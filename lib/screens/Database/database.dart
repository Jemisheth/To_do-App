import 'package:hive_flutter/hive_flutter.dart';

class database {
  List todolists = [];

  final _mybox = Hive.box('mybox');

  void createInitialData() {
    todolists = [];
  }

  void loadata() {
    todolists = _mybox.get("TODOLIST");
  }

  void updatedata() {
    _mybox.put("TODOLIST", todolists);
  }
}
