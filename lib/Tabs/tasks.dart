import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Tabs/taskItems.dart';
import 'package:todo_app/firebase/firebaseFunctions.dart';
import 'package:todo_app/taskModel.dart';

class Tasks extends StatefulWidget {
  Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    return Column(children: [
      DatePicker(
        onDateChange: (selectedDate) {
          time = selectedDate;
          setState(() {});
        },
        time,
        height: 100,
        width: 80,
        initialSelectedDate: time,
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
      ),
      Expanded(
        child: StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseFunctions.getTasks(time),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Somrthing Wrong."));
            }
            var data = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            print(data);
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TaskItems(
                  task: data[index],
                );
              },
            );
          },
        ),
      )
    ]);
  }
}
