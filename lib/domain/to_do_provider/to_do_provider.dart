import 'package:flutter/material.dart';
import 'package:to_do_list_app/domain/todos/todo_boxs.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';

class ToDoProvider extends ChangeNotifier {
  bool isSearch = false;

  double searchWidth = 0;
  // titleController
  static TextEditingController titleController = TextEditingController();
  // toDoController
  static TextEditingController toDoController = TextEditingController();
  // Массив для добавления item

  Future<void> addTodo() async {
    ToDoBoxes.listBox.add(ToDoItemData(
      title: titleController.text.trim(),
      toDo: toDoController.text.trim(),
    ));

    titleController.text = '';
    toDoController.text = '';
  }

  void deleteToDo(int index) async {
    ToDoBoxes.listBox.deleteAt(index);
    titleController.text = '';
    toDoController.text = '';
  }

  void clearNotes() async {
    ToDoBoxes.listBox.clear();
    titleController.text = '';
    toDoController.text = '';
  }

  Future<void> editToDo(int index) async {
    await ToDoBoxes.listBox.putAt(
      index,
      ToDoItemData(
        title: titleController.text,
        toDo: toDoController.text,
      ),
    );
    titleController.text = '';
    toDoController.text = '';
  }
}
