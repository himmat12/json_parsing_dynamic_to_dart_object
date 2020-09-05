import 'package:flutter/material.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/managers/hospital_manager.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/models/hospital_model.dart';

class SearchHospital extends SearchDelegate {
  HospitalManager hospitalManager;

  SearchHospital({this.hospitalManager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: hospitalManager.searchHospital(query: query),
      builder: (context, snapshot) {
        List<Hospital> hospitals = snapshot.data;

        return snapshot.connectionState == ConnectionState.waiting
            ? LinearProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(6),
                        title: Text(hospitals[index].title),
                        // subtitle: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text("Resource : " + hospitals[index].resType),
                        //     Text("lat : " +
                        //         hospitals[index]
                        //             .point
                        //             .coordinates[0]
                        //             .toString()),
                        //     Text("lng : " +
                        //         hospitals[index]
                        //             .point
                        //             .coordinates[1]
                        //             .toString()),
                        //   ],
                        // ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: hospitalManager.hospitalStream,
      builder: (context, snapshot) {
        List<Hospital> hospitals = snapshot.data;

        return snapshot.connectionState == ConnectionState.waiting
            ? LinearProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(6),
                        title: Text(hospitals[index].title),
                        // subtitle: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text("Resource : " + hospitals[index].resType),
                        //     Text("lat : " +
                        //         hospitals[index]
                        //             .point
                        //             .coordinates[0]
                        //             .toString()),
                        //     Text("lng : " +
                        //         hospitals[index]
                        //             .point
                        //             .coordinates[1]
                        //             .toString()),
                        //   ],
                        // ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
