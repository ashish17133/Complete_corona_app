import 'package:corona_app/Network/storeValue.dart';
import 'package:flutter/material.dart';

import 'Network/network.dart';

List<Mythdata> mythdata = [];
bool loading = false;

class Screen1 extends StatefulWidget {
  Screen1({Key key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestgetMyth();
  }

  void requestgetMyth() async {
    setState(() {
      loading = false;
    });
    mythdata = await getMyth();
    setState(() {
      loading = true;
    });
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
          title: Text("Myth about Corona"),
        ),
        body: Container(
          child: MythBoard(),
        ),
      ),
    );
  }
}

class MythBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: mythdata.length,
            itemBuilder: (context, position) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Image(
                        image: (mythdata[position].imageurl == "")
                            ? NetworkImage(
                                "data:image/png;base64,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")
                            : NetworkImage("${mythdata[position].imageurl}")),
                    Text("${mythdata[position].english}"),
                    Text("${mythdata[position].englishans}"),
                    Text("${mythdata[position].nepali}"),
                    Text("${mythdata[position].nepalians}"),
                  ],
                ),
              );
            }));
  }
}
