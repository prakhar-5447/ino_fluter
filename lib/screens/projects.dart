import 'package:flutter/material.dart';
import 'package:ino_fluter/screens/add_project.dart';
import 'package:intl/intl.dart';
import 'package:ino_fluter/models/project.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final List<Project> myProject = [
    Project(
        "React",
        "1",
        "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
        DateTime.now()),
    // Project(
    //     "Node",
    //     "2",
    //     "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
    //     DateTime.now()),
    // Project(
    //     "Angular",
    //     "3",
    //     "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
    //     DateTime.now()),
    // Project(
    //     "Vue.js",
    //     "4",
    //     "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
    //     DateTime.now()),
  ];

  void _add(String title, String id, String desc, DateTime date) {
    final newProject = Project(
      title,
      id,
      desc,
      date,
    );
    setState(() {
      myProject.add(newProject);
    });
  }

  @override
  Widget build(BuildContext context) {
    void _addNewProject(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewProject(_add),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Projects"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
              onPressed: () {
                _addNewProject(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView.builder(
              itemCount: myProject.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.work,
                          size: 45,
                          color: Color.fromRGBO(227, 3, 133, 255),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            myProject[index].title,
                            style: const TextStyle(
                                color: Color.fromRGBO(228, 255, 3, 3),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(myProject[index].description,
                              style:const TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
