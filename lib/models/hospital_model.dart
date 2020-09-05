import 'package:flutter_json_parse_dynamic_into_dart_object/managers/country_manager.dart';

class Hospital {
  String title;
  String resType;
  Point point;

  Hospital({this.title, this.resType, this.point});

  Hospital.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        resType = parsedJson['resourceType'],
        point = parsedJson['point'] == null
            ? null
            : Point.fromJson(parsedJson['point']);
}

class Point {
  String type;
  List coordinates = [];

  Point({this.type, this.coordinates});

  Point.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        coordinates = json['coordinates'];
}
