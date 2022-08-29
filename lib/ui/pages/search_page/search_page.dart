import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/domain/todos/todo_boxs.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';
import 'package:to_do_list_app/generated/l10n.dart';
import 'package:to_do_list_app/ui/themes/text_styles.dart';
import 'package:to_do_list_app/ui/widgets/notes_card/notes_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ToDoItemData> searchToDo = [];

  @override
  void initState() {
    searchToDo = ToDoBoxes.listBox.toMap().values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void search(String query) {
      setState(() {
        searchToDo = ToDoBoxes.listBox.toMap().values.toList().where((toDo) {
          final title = toDo.title.trim().toLowerCase();
          final date = toDo.date.trim().toLowerCase();
          final descr = toDo.toDo.trim().toLowerCase();

          final searchValue = query.trim().toLowerCase();

          return title.contains(searchValue) ||
              date.contains(searchValue) ||
              descr.contains(searchValue);
        }).toList();
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: TextField(
          onChanged: search,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            hintText: S.of(context).search_title,
            hintStyle: TextStyles.appBarTitle.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: false,
        actions: <IconButton>[
          IconButton(
            iconSize: 26.24,
            splashRadius: 26.24,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<ToDoItemData>>(
        valueListenable: ToDoBoxes.listBox.listenable(),
        builder: (context, value, child) {
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: searchToDo.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            itemBuilder: (context, index) {
              return NotesCard(
                index: index,
                item: searchToDo[index],
              );
            },
          );
        },
      ),
    );
  }
}
