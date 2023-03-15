import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(MaterialAppCustom());
}

class MaterialAppCustom extends StatelessWidget {
   const MaterialAppCustom();

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      home: ToDoList(),
      routes: {
        '/detalleTarea':(context) => DetalleTarea(),
      },
    );
   }
} 

class ToDoList extends StatelessWidget {

  //tasks.map((e) => Container(child: Text("Hola"))).toList()

  List<Task> tasks = TaskFactory().generateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(IconData(0xf02d8, fontFamily: 'MaterialIcons')),
             tooltip: 'Lista de tareas',
             onPressed: null,
          ),
          title: const Text("Lista de tareas V1"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Color.fromARGB(197, 255, 255, 255),
          child: Column(
            children: 

              tasks.map((task) => Container(
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color.fromARGB(255, 7, 231, 231)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detalleTarea');
                  },
                    child: const Icon(IconData(0xe7a9, fontFamily: 'MaterialIcons')),
                  ),
                    Text(task.name()),
                    GestureDetector(
                      onTap: (){  
                        task.toggleStatus();
                      },
                      child: task.status() ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank_outlined),
                    )
                  ],
                ),
              )).toList()
          ),
        )
      );
  }
  
}class DetalleTarea extends StatelessWidget {
  const DetalleTarea();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la tarea'),
      ),
      body: const Center(
        child: Text('Aquí van los detalles de la tarea'),
      ),
    );
  }
}