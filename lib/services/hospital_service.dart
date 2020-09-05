import 'package:flutter_json_parse_dynamic_into_dart_object/models/hospital_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HospitalService {
  static String url;
  static List data;
  static var response;

  static Iterable<Hospital> hospitalList = [];

  static Future<List<Hospital>> getHospital({query}) async {
    url = "https://data.nepalcorona.info/api/v1/resources/health";
    response = await http.get(url);
    data = json.decode(response.body);
    hospitalList = data.map((json) => Hospital.fromJson(json));

    if (query != null && query.isNotEmpty) {
      hospitalList = hospitalList
          .where((element) => element.title.toLowerCase().contains(query));
    }

    return hospitalList.toList();
  }
}
