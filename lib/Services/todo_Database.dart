import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:take_note/Model/TaskView.dart';

class DatabaseService extends ChangeNotifier {
  static late Isar isar;
//Isar Baslatilsin

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UserSchema], directory: dir.path);
    fetchTask();
  }

//Gorevler için Liste Olustur

  List<User> taskObjectList = [];

//Gorev Ekle

  Future<void> addTask(String text, String title) async {
    final newTodo = User()
      ..Title = text
      ..taskText = title;
    isar.writeTxn(() => isar.users.put(newTodo));
    fetchTask();
    notifyListeners(); //Güncelle
  }

//Gorevleri Getir

  Future<void> fetchTask() async {
    taskObjectList = await isar.users.where().findAll(); //veriyi datadan al listemize yerleştir
  }

//Gorevleri Günceller
  Future<void> changeTask({required id, required title, required text, bool isdone = false}) async {
    final iterator = await isar.users.get(id);
    if (iterator != null) {
      iterator.Title = title;
      iterator.taskText = text;
      iterator.isDone = isdone;

      await isar.writeTxn(() => isar.users.put(iterator)); //Burda veriyi günceliyorum
    }
    fetchTask();
  }

//Gorevleri Sil

  Future<void> deleteItems(int id) async {
    isar.writeTxn(() => isar.users.delete(id));
    fetchTask();
  }
}
