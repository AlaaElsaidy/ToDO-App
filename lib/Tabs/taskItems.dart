import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/taskModel.dart';

class TaskItems extends StatelessWidget {
  TaskModel task;

  TaskItems({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Slidable(
          startActionPane:
              ActionPane(extentRatio: .6, motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {},
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete_forever_outlined,
            ),
            SlidableAction(
              onPressed: (context) {},
              label: "Edit",
              backgroundColor: Colors.blue,
              icon: Icons.edit,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(task.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
