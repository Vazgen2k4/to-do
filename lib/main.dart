import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/domain/todos/todo_boxs.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';
import 'package:to_do_list_app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<ToDoItemData>(ToDoItemDataAdapter());
  await Hive.openBox<ToDoItemData>(ToDoBoxesKeys.listBoxKeys);

  runApp(const ToDoApp());
}
