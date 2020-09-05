import 'package:flutter/material.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/managers/country_manager.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/models/country_model.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  CountryManager countryManager = new CountryManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Lists"),
      ),
      body: StreamBuilder<List<Country>>(
          stream: countryManager.countryStream,
          builder: (context, snapshot) {
            List<Country> hospitals = snapshot.data;

            return snapshot.connectionState == ConnectionState.waiting
                ? LinearProgressIndicator()
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: hospitals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(hospitals[index].country),
                        subtitle: Text(hospitals[index].countryInfo == null
                            ? "no data"
                            : hospitals[index].countryInfo.lat.toString()),
                      );
                    },
                  );
          }),
    );
  }
}
