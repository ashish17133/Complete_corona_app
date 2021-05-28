import 'package:corona_app/Network/network.dart';
import 'package:flutter/material.dart';

import 'Network/storeValue.dart';

bool loadingg = false;
List<Hospital> myhospitallist;

class screen2 extends StatefulWidget {
  screen2({Key key}) : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  void requestgetHospital() async {
    setState(() {
      loadingg = false;
    });
    myhospitallist = await getHospital();
    setState(() {
      loadingg = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestgetHospital();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Hospital for Corona"),
        ),
        body: Container(
          child: (loadingg == false)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: myhospitallist.length,
                  itemBuilder: (context, position) {
                    return Card(
                      color: Colors.lightBlueAccent,
                      child: Column(
                        children: [
                          Text(
                            "${myhospitallist[position].name}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Address:${myhospitallist[position].address}",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "State: ${myhospitallist[position].state}",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "Phone No: ${myhospitallist[position].phoneno}",
                            style: TextStyle(fontSize: 10),
                          ),
                          Card(
                            color: Colors.lightGreen,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Capacity Of this hospital",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Bed: ${myhospitallist[position].capacity_bed}"),
                                Text(
                                    "Ventilator: ${myhospitallist[position].capacity_ventilator}"),
                                Text(
                                    "Isolation: ${myhospitallist[position].capacity_isolation}"),
                                Text(
                                    "Doctor: ${myhospitallist[position].capacity_doctor}"),
                                Text(
                                    "Nurse:${myhospitallist[position].capacity_nurse} "),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
