import 'package:flutter/material.dart';
import 'package:ino_fluter/providers/project_provider.dart';
import 'package:ino_fluter/screens/add_project.dart';
import 'package:ino_fluter/screens/timeline.dart';
import 'package:intl/intl.dart';
import 'package:ino_fluter/models/project.dart';
import 'package:provider/provider.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final List<Project> myProject =
        Provider.of<ProductData>(context, listen: true).myProject;

    void _addNewProject(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child:
                NewProject(Provider.of<ProductData>(context, listen: true).add),
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
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Timeline.routeName,
                                  arguments: (index));
                            },
                            child: Text(
                              myProject[index].title,
                              style: const TextStyle(
                                  color: Color.fromARGB(252, 255, 10, 2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(myProject[index].description,
                              style: const TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
