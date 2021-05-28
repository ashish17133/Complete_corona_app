import 'package:corona_app/Hospital.dart';
import 'package:corona_app/Network/storeValue.dart';
import 'package:flutter/material.dart';

import 'Myth.dart';
import 'Network/network.dart';

bool loading = false;
Coronadata output = Coronadata();
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestdata();
    setState(() {});
  }

  void requestdata() async {
    setState(() {
      loading = false;
    });
    output = await requestCoronaData();
    print(output.totalActiveCase);
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Complete Corona App"),
          centerTitle: true,
        ),
        body: Center(
          child: (loading == false)
              ? CircularProgressIndicator()
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MyItem(
                            leading: "🔬",
                            title: "Total Active Case",
                            trailing: "${output.totalActiveCase}",
                          ),
                          MyItem(
                            leading: "🦠",
                            title: "Total Positive Case",
                            trailing: "${output.totalPositiveCase}",
                          ),
                          MyItem(
                            leading: "💪",
                            title: "Total Recovered Case",
                            trailing: "${output.totalRecoveredCase}",
                          ),
                          MyItem(
                            leading: "😭",
                            title: "Total Deaths",
                            trailing: "${output.totalDeaths}",
                          ),
                          MyItem(
                            leading: "😷",
                            title: "New Confirm Case",
                            trailing: "${output.newConfirmCase}",
                          ),
                          MyItem(
                            leading: "💪",
                            title: "New Recovered Case",
                            trailing: "${output.newRecoveredCase}",
                          ),
                          MyItem(
                            leading: "😭",
                            title: "New Deaths",
                            trailing: "${output.newDeaths}",
                          ),
                          MyItem(
                            leading: '🕒',
                            title: 'Update Time:',
                            trailing: "${output.dateeTime}",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyBoard(
                                title: "Myth",
                                icon: Icons.dashboard,
                                onpress: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Screen1();
                                  }));
                                },
                              ),
                              MyBoard(
                                title: "Hospital",
                                icon: Icons.local_hospital,
                                onpress: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return screen2();
                                  }));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}

class MyItem extends StatelessWidget {
  String trailing;
  String title;
  String leading;

  MyItem({this.leading, this.trailing, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          this.leading,
          style: TextStyle(fontFamily: "NotoEmoji"),
        ),
        title: Text(this.title),
        trailing: Text(this.trailing),
      ),
    );
  }
}

class MyBoard extends StatelessWidget {
  IconData icon;
  String title;
  Function onpress;

  MyBoard({@required this.icon, @required this.onpress, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        child: Container(
          height: 70,
          width: 150,
          child: Column(
            children: [Icon(this.icon), Text(this.title)],
          ),
        ),
      ),
    );
  }
}
