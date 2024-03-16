import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/taskModel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("Task")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel taskModel) async {
    var collection = getCollection();
    var docRf = collection.doc();
    taskModel.id = docRf.id;
    docRf.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime selectedTime) {
    var collection = getCollection()
        .where('date',
            isEqualTo: DateUtils.dateOnly(selectedTime).millisecondsSinceEpoch)
        .snapshots();
    return collection;
  }
}
