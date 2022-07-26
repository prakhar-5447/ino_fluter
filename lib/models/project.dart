import "package:flutter/foundation.dart";
import 'package:ino_fluter/models/timeline_format.dart';

class Project {
  final String title;
  final String id;
  final String description;
  final DateTime createdDate;
  List<Timeline_format> timeline = [];

  Project(@required this.title, @required this.id, @required this.description,
      @required this.createdDate);
}
