import 'package:isar/isar.dart';

part 'TaskView.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? taskText;
  bool? isDone = false;

  String? Title;
}
