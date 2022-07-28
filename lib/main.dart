import 'package:flutter/material.dart';
import './screens/projects.dart';
import './screens/timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1:const  TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2:const TextStyle(
              color:  Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoConsensed',
            )),
      ),
      routes: {
        '/': (context) => Projects(),
        Timeline.routeName: (context) => Timeline(),
      },
    );
  }
}
