class Country {
  String country;
  CountryInfo countryInfo;

  Country({this.country, this.countryInfo});

  Country.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        countryInfo = json['countryInfo'] == null
            ? null
            : CountryInfo.fromJson(json['countryInfo']);
}

class CountryInfo {
  double lat;
  double lng;

  CountryInfo({this.lat, this.lng});

  CountryInfo.fromJson(Map<String, dynamic> parsedJson)
      : lat = (parsedJson['lat'] as num).toDouble(),
        lng = (parsedJson['long'] as num).toDouble();
}
