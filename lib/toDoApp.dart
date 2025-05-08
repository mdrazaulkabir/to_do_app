import 'package:flutter/material.dart';

class toDoApp extends StatefulWidget {
  const toDoApp({super.key});

  @override
  State<toDoApp> createState() => _toDoAppState();
}

class _toDoAppState extends State<toDoApp> {
  TextEditingController addController = TextEditingController();

  //String? addTask;

  List<String> Task = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          "To-Do App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                        hintText: "Enter task",
                        labelText: 'Task',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.greenAccent,
                        filled: true,
                        prefixIcon: Icon(Icons.task)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                TextButton(
                    onPressed: () {
                      if (addController.text.isNotEmpty) {
                        setState(() {
                          Task.add(addController.text);
                          addController.clear();
                        });
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(double.minPositive, double.infinity),
                        // minimumSize: Size(20, 30),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.greenAccent),
                    child: Text("Add")),
              ],
            ),
            // TextButton(
            //     onPressed: () {},
            //     style: OutlinedButton.styleFrom(
            //
            //         backgroundColor: Colors.greenAccent,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10))),
            //     child: Text("submit")),
            SizedBox(
              height: 15,
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: Task.length, itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(Task[index]),
                        //leading: Icon(Icons.delete),
                        trailing: IconButton(
                            onPressed: () {
                             setState(() {
                               Task.removeAt(index);
                             });
                            },
                            icon: Icon(Icons.delete)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.greenAccent, width: 5),
                        ));
              }),
            ),


          ],
        ),
      ),
    );
  }
}
