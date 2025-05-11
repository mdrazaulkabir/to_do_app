import 'package:flutter/material.dart';

class toDoApp extends StatefulWidget {
  final String name,phone,gmail;
  const toDoApp({super.key,required this.name,required this.phone,required this.gmail});

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "To-Do App",
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    border: Border.all(color: Colors.yellowAccent, width: 4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 26,
                          backgroundColor: Colors.greenAccent,
                          color: Colors.black,
                          shadows: [
                            BoxShadow(offset: Offset(4, 4), blurRadius: 4,color:Colors.blueGrey)
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Your name is: ${widget.name}",style: TextStyle(fontSize: 18),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Your phone number is: ${widget.phone} ",style: TextStyle(fontSize: 18),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Your email is : ${widget.gmail}",style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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

              SizedBox(height: 300,
                child: ListView.builder(
                    itemCount: Task.length,
                    itemBuilder: (context, index) {
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
                            side: BorderSide(color: Colors.redAccent, width: 5),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
