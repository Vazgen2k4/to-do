import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/domain/locale_provider/locale_provider.dart';
import 'package:to_do_list_app/domain/to_do_provider/to_do_provider.dart';
import 'package:to_do_list_app/domain/todos/todo_boxs.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';
import 'package:to_do_list_app/generated/l10n.dart';
import 'package:to_do_list_app/ui/app_navigator/app_routes.dart';
import 'package:to_do_list_app/ui/themes/app_colors.dart';
import 'package:to_do_list_app/ui/themes/text_styles.dart';
import 'package:to_do_list_app/ui/widgets/notes_card/notes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ToDoProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColors.backgroundColor,
        leading: LocalizeWidget(),
        title: Text(
          S.of(context).home_page_title,
          style: TextStyles.appBarTitle,
        ),
        centerTitle: true,
        actions: <IconButton>[
          IconButton(
            iconSize: 26.24,
            splashRadius: 26.24,
            color: AppColors.lightDarkColor,
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.search),
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            splashColor: const Color.fromARGB(255, 151, 15, 6),
            iconSize: 26.24,
            splashRadius: 26.24,
            color: const Color.fromARGB(255, 180, 18, 6),
            onPressed: model.clearNotes,
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        elevation: 3,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addNotes),
        child: const Icon(
          Icons.edit,
          size: 18,
          color: AppColors.buttonColor,
        ),
      ),
      body: ValueListenableBuilder<Box<ToDoItemData>>(
        valueListenable: ToDoBoxes.listBox.listenable(),
        builder: (context, value, child) {
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: ToDoBoxes.listBox.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            itemBuilder: (context, index) {
              return NotesCard(
                index: index,
                item: ToDoBoxes.listBox.getAt(index),
              );
            },
          );
        },
      ),
    );
  }
}

class LocalizeWidget extends StatefulWidget {
  const LocalizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LocalizeWidget> createState() => _LocalizeWidgetState();
}

class _LocalizeWidgetState extends State<LocalizeWidget> {
  List<String> _items = ['ru', 'en', 'uz'];
  late String select;

  @override
  void initState() {
    // TODO: implement initState
    select = _items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          icon: const SizedBox(),
          value: select,
          items: _items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
              onTap: () async {
                Provider.of<LocaleProvider>(context, listen: false)
                    .setLocale(Locale(item));
              },
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              select = value ?? 'ru';
            });
          },
        ),
      ),
    );
  }
}
