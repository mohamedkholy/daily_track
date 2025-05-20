import 'package:daily_track/core/widgets/add_task_dialog.dart';
import 'package:daily_track/core/widgets/edit_title_dialog.dart';
import 'package:daily_track/features/routine/data/models/item.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:flutter/material.dart';
import 'delete_dialog.dart';

class DeleteEditMenu extends StatelessWidget {
  final Item item;
  final Widget child;
  final VoidCallback onOkPressed;
  final Function(String)? onSavePressed;
  final Function(Task)? onTaskSaved;

  const DeleteEditMenu({
    super.key,
    required this.item,
    required this.child,
    required this.onOkPressed,
    this.onSavePressed,
    this.onTaskSaved,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) async {
        final result = await showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx, // X position
            details.globalPosition.dy, // Y position
            details.globalPosition.dx + 1,
            details.globalPosition.dy + 1,
          ),
          items: [
            const PopupMenuItem(value: "edit", child: Text("Edit")),
            const PopupMenuItem(value: "delete", child: Text("Delete")),
          ],
        );

        // Handle menu item selection
        if (result != null && context.mounted) {
          if (result == "delete") {
            showDeleteDialog(
              context: context,
              deletedItemTitle: item.title,
              onOkPressed: onOkPressed,
            );
          } else {
            if (item is Task) {
              showDialog(
                context: context,
                builder:
                    (context) =>
                        AddTaskDialog(onTaskSaved!, task: item as Task),
              );
            } else {
              showDialog(
                context: context,
                builder:
                    (context) => EditTitleDialog(
                      buildContext: context,
                      item: item,
                      onSavePressed: onSavePressed!,
                      taskTitleKey: GlobalKey(),
                    ),
              );
            }
          }
        }
      },
      child: child,
    );
  }
}
