import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';

abstract class ToDoBoxes {
  ToDoBoxes._();

  static final Box<ToDoItemData> listBox =
      Hive.box<ToDoItemData>('todo-list-epta');
}

abstract class ToDoBoxesKeys {
  ToDoBoxesKeys._();

  static const String listBoxKeys = ('todo-list-epta');
}
