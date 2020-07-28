import 'dart:convert';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List decodedObject;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jsonDecodeObject();
  }

  jsonDecodeObject() async {
    String doc =
        await DefaultAssetBundle.of(context).loadString('assets/section.json');
    setState(() {
      decodedObject = jsonDecode(doc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: decodedObject?.length,
          itemBuilder: (context, int i) {
            print(decodedObject[i]['header']);
            return Container(
              height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        decodedObject[i]['header'],
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: decodedObject[i]['item'].length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: GridTile(
                            child: Center(
                              child: Text(
                                decodedObject[i]['item'][index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ), //just for testing, will fill with image later
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
