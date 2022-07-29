import 'package:flutter/material.dart';
import 'package:ino_fluter/providers/project_provider.dart';
import 'package:ino_fluter/screens/add_timeline.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import './projects.dart';

class Timeline extends StatelessWidget {
  static String routeName = '/timeline';

  @override
  Widget build(BuildContext context) {
    final deleteTimeline =
        Provider.of<ProductData>(context, listen: true).deleteTimeline;
    final delete = Provider.of<ProductData>(context, listen: true).delete;
    void _addNewTimeline(BuildContext ctx, int index) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTimeline(
                Provider.of<ProductData>(context, listen: true).addTimeline,
                index),
          );
        },
      );
    }

    final routeArgs = ModalRoute.of(context)!.settings.arguments;
    final index = routeArgs.toString();
    final data = Provider.of<ProductData>(context, listen: true)
        .FindbyID(int.parse(index));
    return Scaffold(
        appBar: AppBar(
          title: Text(data.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
              onPressed: () {
                _addNewTimeline(context, int.parse(index));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                delete(int.parse(index));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView.builder(
              itemCount: data.timeline.length,
              itemBuilder: (BuildContext context, int tindex) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            DateFormat('dd-MM-yyyy')
                                .format(data.timeline[tindex].date),
                            style: const TextStyle(
                                color: Color.fromARGB(252, 255, 10, 2),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(data.timeline[tindex].description,
                              style: const TextStyle(fontSize: 12)),
                        ),
                        trailing: GestureDetector(
                          onTap: () =>
                              {deleteTimeline(int.parse(index), tindex)},
                          child: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
