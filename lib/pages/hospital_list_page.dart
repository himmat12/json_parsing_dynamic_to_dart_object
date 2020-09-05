import 'package:flutter/material.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/managers/hospital_manager.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/models/hospital_model.dart';
import 'package:flutter_json_parse_dynamic_into_dart_object/pages/search_hospital.dart';

class HospitalListPage extends StatefulWidget {
  @override
  _HospitalListPageState createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  HospitalManager hospitalManager = HospitalManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Health Resources"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchHospital(hospitalManager: hospitalManager));
            },
          )
        ],
      ),
      body: StreamBuilder(
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
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Resource : " + hospitals[index].resType),
                              Text("lat : " +
                                  hospitals[index]
                                      .point
                                      .coordinates[0]
                                      .toString()),
                              Text("lng : " +
                                  hospitals[index]
                                      .point
                                      .coordinates[1]
                                      .toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
