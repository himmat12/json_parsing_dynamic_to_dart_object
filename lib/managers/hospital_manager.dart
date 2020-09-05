import 'package:flutter_json_parse_dynamic_into_dart_object/models/hospital_model.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/services/hospital_service.dart';

class HospitalManager {
  Stream<List<Hospital>> get hospitalStream =>
      Stream.fromFuture(HospitalService.getHospital());

  Stream<List<Hospital>> searchHospital({query}) =>
      Stream.fromFuture(HospitalService.getHospital(query: query));
}
