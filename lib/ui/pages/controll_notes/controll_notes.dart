import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/domain/to_do_provider/to_do_provider.dart';
import 'package:to_do_list_app/domain/todos/todo_boxs.dart';
import 'package:to_do_list_app/generated/l10n.dart';
import 'package:to_do_list_app/ui/themes/app_colors.dart';
import 'package:to_do_list_app/ui/themes/text_styles.dart';

class ControllNotes extends StatefulWidget {
  final bool isChange;

  const ControllNotes({Key? key, this.isChange = false}) : super(key: key);

  @override
  State<ControllNotes> createState() => _ControllNotesState();
}

class _ControllNotesState extends State<ControllNotes> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final String _title =
        widget.isChange ? S.of(context).error_txt : S.of(context).add_title;
    int index = -1;

    var data = ModalRoute.of(context)?.settings.arguments;

    if (widget.isChange && data != null && data is int) {
      index = data;
      ToDoProvider.titleController.text =
          ToDoBoxes.listBox.getAt(index)?.title ?? '------';
      ToDoProvider.toDoController.text =
          ToDoBoxes.listBox.getAt(index)?.toDo ?? '=======';
    }

    InputDecoration _decoration = InputDecoration(
      labelText: S.of(context).title,
      labelStyle: const TextStyle(
        color: Color(0xff49454F),
        fontSize: 12,
        height: 1.33,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff79747E),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff79747E),
        ),
      ),
      errorText: hasError ? S.of(context).error_txt : null,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(
          _title,
          style: TextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: _decoration,
                controller: ToDoProvider.titleController,
                maxLength: 19,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: ToDoProvider.toDoController,
                decoration: _decoration.copyWith(
                  labelText: S.of(context).note,
                ),
                minLines: 1,
                maxLines: 7,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  backgroundColor: AppColors.backgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  onPressed: () async {
                    if (ToDoProvider.titleController.value.text.isEmpty ||
                        ToDoProvider.toDoController.value.text.isEmpty) {
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      final model = context.read<ToDoProvider>();

                      widget.isChange
                          ? await model.editToDo(index)
                          : await model.addTodo();

                      Navigator.of(context).pop();
                    }
                  },
                  label: Text(
                    _title,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.42,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
