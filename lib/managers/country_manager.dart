import 'package:flutter_json_parse_dynamic_into_dart_object/models/country_model.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/services/country_service.dart';

class CountryManager {
  Stream<List<Country>> get countryStream =>
      Stream.fromFuture(CountryService.getCountry());
}
