import 'package:flutter_json_parse_dynamic_into_dart_object/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryService {
  static String url;
  static List data = [];
  static var response;

  static List<Country> countryList = [];

  static Future<List<Country>> getCountry() async {
    url = "https://nepalcorona.info/api/v1/data/world";
    response = await http.get(url);
    data = json.decode(response.body);
    countryList = data.map((json) => Country.fromJson(json)).toList();
    return countryList;
  }
}
