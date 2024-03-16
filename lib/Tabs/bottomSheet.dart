import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebaseFunctions.dart';
import 'package:todo_app/taskModel.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime? time = DateTime.now();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add New Task:",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w200),
            keyboardType: TextInputType.text,
            controller: titleController,
            decoration: InputDecoration(
                hintText: "Title",
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2))),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w200),
            keyboardType: TextInputType.text,
            controller: descController,
            decoration: InputDecoration(
                hintText: "Description",
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2))),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Select Time:"),
          SizedBox(
            height: 25,
          ),
          InkWell(
              onTap: () async {
                DateTime? selectedtime = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  initialDate: time,
                  barrierDismissible: false,
                  // builder: (context, child) =>Theme(
                  //     data: Theme.of(context).copyWith(
                  //       colorScheme: ColorScheme.light(
                  //         // primary: Colors.white,
                  //         onPrimary: Colors.blue,
                  //         surface: Colors.white,
                  //         onSurface: Colors.black,
                  //         secondary: Colors.white,
                  //         onSecondary: Colors.blueAccent
                  //
                  //       )
                  //     ),
                  //
                  //  child: child!)
                );
                if (selectedtime != null) {
                  time = selectedtime;
                  setState(() {});
                }
              },
              child: Text(
                "${time.toString().substring(0, 10)}",
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                TaskModel taskModel = TaskModel(
                    title: titleController.text,
                    description: descController.text,
                    date: DateUtils.dateOnly(time!).millisecondsSinceEpoch);
                FirebaseFunctions.addTask(taskModel).then((_) {
                  Navigator.pop(context);
                });
              },
              child: Text(
                "Add Task",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
