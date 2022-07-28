import 'package:flutter/material.dart';
import '../models/project.dart';
import './projects.dart';

class Timeline extends StatelessWidget {
  static String routeName = '/timeline';
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments;
    final index = routeArgs;

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [Text(index.toString())],
        ));
  }
}
