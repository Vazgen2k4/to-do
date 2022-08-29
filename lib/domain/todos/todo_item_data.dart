import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'todo_item_data.g.dart';

@HiveType(typeId: 0)
class ToDoItemData {
  @HiveField(0)
  String title;
  @HiveField(1)
  String toDo;
  @HiveField(2)
  late String date;

  ToDoItemData({
    required this.title,
    required this.toDo,
  }) {
    final data = DateTime.now();
    date = DateFormat(
      'dd.MM.y - hh:mm',
    ).format(data);
  }

  // @override
  // bool operator ==(other) {
  //   return other is ToDoItemData && title == other.title && toDo == other.toDo;
  // }

  // @override
  // int get hashCode => title.hashCode + toDo.hashCode;
}
