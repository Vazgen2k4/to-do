import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/domain/to_do_provider/to_do_provider.dart';
import 'package:to_do_list_app/domain/todos/todo_item_data.dart';
import 'package:to_do_list_app/generated/l10n.dart';
import 'package:to_do_list_app/ui/app_navigator/app_routes.dart';
import 'package:to_do_list_app/ui/themes/app_colors.dart';
import 'package:to_do_list_app/ui/themes/text_styles.dart';

class NotesCard extends StatelessWidget {
  final ToDoItemData? item;
  final int index;

  const NotesCard({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          )
        ],
        color: AppColors.notesCardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NotesCardTitleContent(
            index: index,
            date: item?.date ?? '00.00.0000',
            title: item?.title ?? 'Заголовок',
          ),
          const SizedBox(height: 9),
          Text(
            item?.toDo ?? 'Заметка....',
            style: TextStyles.noteStyle,
          ),
        ],
      ),
    );
  }
}

class NotesCardTitleContent extends StatelessWidget {
  final String title;
  final String date;

  final int index;
  const NotesCardTitleContent({
    Key? key,
    required this.title,
    required this.index,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ToDoProvider>();

    final List<DropdownMenuItem<String>> _items = [
      DropdownMenuItem(
        value: '1',
        child: TextButton.icon(
          icon: const Icon(Icons.edit_outlined),
          label: Text(S.of(context).edit_node),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.changeNotes,
              arguments: index,
            );
          },
        ),
      ),
      DropdownMenuItem(
        value: '2',
        child: TextButton.icon(
          onPressed: () => model.deleteToDo(index),
          icon: const Icon(Icons.delete),
          label: Text(S.of(context).remove),
        ),
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Text(
                title,
                style: TextStyles.noteTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: TextStyles.noteTime,
            ),
          ],
        ),
        ClipRRect(
          child: DropdownButton<String>(
            isExpanded: false,
            items: _items,
            onTap: () {},
            onChanged: (dynamic value) {},
            icon: const SizedBox(width: 0, height: 0),
            hint: const Icon(Icons.more_vert),
            underline: const SizedBox(width: 0, height: 0),
            alignment: Alignment.topRight,
          ),
        ),
      ],
    );
  }
}
