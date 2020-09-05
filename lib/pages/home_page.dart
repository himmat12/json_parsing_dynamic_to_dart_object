import 'package:flutter/material.dart';

import 'country_list_page.dart';
import 'hospital_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex Dynamic JSON Into Dart Object "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountryListPage()));
                },
                title: Text(
                    "Parsing Complex JSON (nested map structure): Dynamic JSON Objects Into Dart Objects"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalListPage()));
                },
                title: Text(
                    "Parsing Complex JSON (nested list inside map structure): Dynamic JSON Objects Into Dart Objects"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
