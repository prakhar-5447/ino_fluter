import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ino_fluter/models/project.dart';
import 'package:ino_fluter/models/timeline_format.dart';

class ProductData with ChangeNotifier {
  List<Project> myProjects = [
    Project(
        "React",
        "1",
        "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
        DateTime.now()),
    Project(
        "Node",
        "2",
        "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
        DateTime.now()),
    Project(
        "Angular",
        "3",
        "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
        DateTime.now()),
    Project(
        "Vue.js",
        "4",
        "The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.",
        DateTime.now()),
  ];

  List<Project> get myProject {
    return [...myProjects];
  }

  void add(String title, String id, String desc, DateTime date) {
    final newProject = Project(
      title,
      id,
      desc,
      date,
    );
    myProjects.add(newProject);
    notifyListeners();
  }

  void addTimeline(String desc, DateTime date, int index) {
    final newTimeline = Timeline_format(
      desc,
      date,
    );
    myProjects[index].timeline.add(newTimeline);
    myProjects[index].timeline.sort((a, b) => a.date.compareTo(b.date));

    notifyListeners();
  }

  void delete(int index) {
    myProjects.removeAt(index);
    notifyListeners();
  }

  void deleteTimeline(int index, int tIndex) {
    myProjects[index].timeline.removeAt(tIndex);
    notifyListeners();
  }

  Project FindbyID(int index) {
    return myProjects[index];
  }
}
