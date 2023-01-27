import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({Key? key}) : super(key: key);

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  final List<GroupTask> myTasks = [
    GroupTask(title: "Acheter du jack daniels", assignedTo: "Bob"),
    GroupTask(title: "Acheter de la grande weed", assignedTo: "Alice", isCompleted: true),
  ];
  final TextEditingController titleController = TextEditingController();

  final TextEditingController assignedToController = TextEditingController();

  void _addNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ajouter une nouvelle tâche"),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Titre de la tâche"),
                  controller: titleController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Assigné à"),
                  controller: assignedToController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Text("Ajouter"),
              onPressed: () {
                setState(() {
                  myTasks.add(GroupTask(
                      title: titleController.text,
                      assignedTo: assignedToController.text));
                });
                titleController.clear();
                assignedToController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text("Tasks"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: myTasks.length,
        itemBuilder: (context, index) {
          final task = myTasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text("Assignée à : ${task.assignedTo}"),
            trailing: task.isCompleted
                ? Icon(Icons.check_circle, color: Colors.green)
                : Icon(Icons.access_time, color: Colors.orange),

            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Modifier la tâche"),
                    content: Form(

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            initialValue: task.title,
                            onChanged: (value) {
                              task.title = value;
                            },
                          ),
                          TextFormField(
                            initialValue: task.assignedTo,
                            onChanged: (value) {
                              if(value.isNotEmpty)
                              task.assignedTo = value;

                            },

                          ),
                          CheckboxListTile(
                            value: task.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                task.isCompleted = value ?? true;

                              });
                            },
                            title: Text("Tâche terminée"),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      MaterialButton(
                        child: Text("Annuler"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      MaterialButton(
                        child: Text("Enregistrer"),
                        onPressed: () {
                          setState(() {
                            myTasks[index] = task;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },

          );

        },
      ),
    );
  }
}
class GroupTask {
   String title;
  String assignedTo;
  bool isCompleted;

  GroupTask({required this.title, required this.assignedTo, this.isCompleted = false});

  void markAsCompleted() {
    isCompleted = true;
  }


}

